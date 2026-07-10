# Admin 2FA Per-Account Fix + Root Super Admin Management

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Fix admin 2FA so each staff account has independent email OTP login 2FA, and give the root Super Admin a dashboard UI on **Manage Admin(s)** to read and manage 2FA for any other admin (Super Admin, Admin, Manager, Conversion Agent, etc.) for recovery.

**Architecture:** Keep the existing custom `admin` guard and email OTP flow. Move “2FA passed this login” from database columns (`pass_2fa`, `token_2fa_expiry`) into Laravel session keys scoped to the logged-in admin ID. Add `ADMIN_ROOT_ID` config so only the default root Super Admin (id `1` by default) can enable/disable/reset/resend 2FA for other accounts. Extend `madmin.blade.php` (Managers List) with a 2FA status column and recovery actions. Add server-side middleware so manager routes are not only hidden in the sidebar.

**Tech Stack:** Laravel 8, PHP 7.3+/8.0, custom `admin` guard, existing `Twofa` mailable, Blade + Bootstrap modals (existing admin UI pattern).

## Global Constraints

- Project path: `C:\xampp\htdocs\grandbank`
- Do **not** add Fortify/Jetstream/Spatie for admin auth — extend existing code only
- End-user TOTP (Fortify) must remain unchanged
- Root Super Admin is identified by `config('admin.root_id')` defaulting to `1` via `ADMIN_ROOT_ID` env
- Only root Super Admin may manage **other** admins’ 2FA; all admins may still manage **own** 2FA on profile page
- Never display live OTP codes in the dashboard UI — only enable/disable/reset/resend
- `enable_2fa` allowed values: `enabled` | `disabled` only
- No new auth package dependencies

---

## File Map

| File | Action | Responsibility |
|------|--------|----------------|
| `config/admin.php` | Create | Root admin ID config |
| `.env.example` | Modify | Document `ADMIN_ROOT_ID=1` |
| `app/Support/AdminAuth.php` | Create | `isRootAdmin()`, `normalizeTwoFactorStatus()` |
| `app/Http/Middleware/EnsureSuperAdmin.php` | Create | Block non–Super Admin from manager routes |
| `app/Http/Middleware/EnsureRootSuperAdmin.php` | Create | Block non-root from 2FA recovery routes |
| `app/Http/Kernel.php` | Modify | Register `superadmin`, `rootadmin` middleware |
| `app/Http/Middleware/TwoFactorVerify.php` | Modify | Session-based 2FA gate |
| `app/Http/Controllers/Admin/Auth/LoginController.php` | Modify | Clear session 2FA flags; generate OTP per user |
| `app/Http/Controllers/Admin/TwoFactorController.php` | Modify | Set session on verify; rate limit resend |
| `app/Http/Controllers/Admin/ManageAdminController.php` | Modify | Profile validation + root 2FA management methods |
| `app/Http/Controllers/Admin/HomeController.php` | Modify | Pass 2FA summary data to madmin view |
| `app/Models/Admin.php` | Modify | Fillable/casts, helper methods |
| `app/Models/AdminTwoFactorLog.php` | Create | Audit log model |
| `database/migrations/2026_07_09_000001_create_admin_two_factor_logs_table.php` | Create | Audit table |
| `database/migrations/2026_07_09_000002_normalize_admin_enable_2fa_values.php` | Create | Fix `disbaled` typo rows |
| `routes/admin.php` | Modify | Middleware groups + new 2FA routes |
| `resources/views/admin/madmin.blade.php` | Modify | 2FA column + root management UI |
| `resources/views/admin/Profile/profile.blade.php` | Modify | Fix 2FA select dropdown |
| `tests/Feature/AdminTwoFactorManagementTest.php` | Create | Feature tests |

---

## Phase 1 — Session-Based Per-Account 2FA (Foundation)

### Task 1: Admin config and support helpers

**Files:**
- Create: `config/admin.php`
- Create: `app/Support/AdminAuth.php`
- Modify: `.env.example`

**Interfaces:**
- Produces: `AdminAuth::isRootAdmin(Admin $admin): bool`
- Produces: `AdminAuth::twoFactorPassed(Admin $admin): bool`
- Produces: `AdminAuth::markTwoFactorPassed(Admin $admin): void`
- Produces: `AdminAuth::clearTwoFactorSession(): void`
- Produces: `AdminAuth::normalizeTwoFactorStatus(?string $value): string` → `'enabled'|'disabled'`

- [ ] **Step 1: Create `config/admin.php`**

```php
<?php

return [
    'root_id' => (int) env('ADMIN_ROOT_ID', 1),
];
```

- [ ] **Step 2: Create `app/Support/AdminAuth.php`**

```php
<?php

namespace App\Support;

use App\Models\Admin;

class AdminAuth
{
    public const SESSION_PASSED = 'admin_2fa_passed';
    public const SESSION_USER_ID = 'admin_2fa_user_id';

    public static function isRootAdmin(?Admin $admin): bool
    {
        return $admin && (int) $admin->id === (int) config('admin.root_id', 1);
    }

    public static function normalizeTwoFactorStatus(?string $value): string
    {
        return $value === 'enabled' ? 'enabled' : 'disabled';
    }

    public static function twoFactorPassed(Admin $admin): bool
    {
        return session(self::SESSION_PASSED) === true
            && (int) session(self::SESSION_USER_ID) === (int) $admin->id;
    }

    public static function markTwoFactorPassed(Admin $admin): void
    {
        session([
            self::SESSION_PASSED => true,
            self::SESSION_USER_ID => (int) $admin->id,
        ]);
    }

    public static function clearTwoFactorSession(): void
    {
        session()->forget([self::SESSION_PASSED, self::SESSION_USER_ID]);
    }
}
```

- [ ] **Step 3: Add to `.env.example`**

```
ADMIN_ROOT_ID=1
```

- [ ] **Step 4: Verify**

Run: `php artisan config:clear`
Expected: no errors

---

### Task 2: Session-based TwoFactorVerify middleware

**Files:**
- Modify: `app/Http/Middleware/TwoFactorVerify.php`

**Interfaces:**
- Consumes: `AdminAuth::twoFactorPassed()`, `AdminAuth::normalizeTwoFactorStatus()`

- [ ] **Step 1: Replace middleware handle() logic**

```php
public function handle($request, Closure $next)
{
    $admin = Auth::guard('admin')->user();

    if (!$admin) {
        return redirect()->route('adminloginform');
    }

    $fresh = Admin::query()->find($admin->id);

    if (!$fresh) {
        Auth::guard('admin')->logout();
        return redirect()->route('adminloginform');
    }

    if (AdminAuth::normalizeTwoFactorStatus($fresh->enable_2fa) === 'enabled'
        && !AdminAuth::twoFactorPassed($fresh)) {
        return redirect('/admin/2fa');
    }

    return $next($request);
}
```

- [ ] **Step 2: Manual test**

1. Set one admin `enable_2fa = enabled` in DB
2. Login → should redirect `/admin/2fa` before dashboard
3. Set another admin `enable_2fa = disabled` → login goes to dashboard without OTP

---

### Task 3: Login and verify controllers

**Files:**
- Modify: `app/Http/Controllers/Admin/Auth/LoginController.php`
- Modify: `app/Http/Controllers/Admin/TwoFactorController.php`

**Interfaces:**
- Consumes: `AdminAuth::clearTwoFactorSession()`, `AdminAuth::markTwoFactorPassed()`
- Produces: login clears session; verify sets session

- [ ] **Step 1: Update `adminlogin()` — after successful `attempt()`**

Add immediately after `$request->session()->regenerate();`:

```php
AdminAuth::clearTwoFactorSession();
```

Change 2FA branch to use normalized status:

```php
if (AdminAuth::normalizeTwoFactorStatus($user->enable_2fa) === 'enabled') {
    $token = (string) mt_rand(10000, 99999);
    Admin::where('id', $user->id)->update([
        'token_2fa' => $token,
    ]);
    // ... existing mail send ...
    return redirect()->intended('/admin/2fa');
}
```

Remove setting `pass_2fa = false` on login (no longer used for gating).

- [ ] **Step 2: Update `adminlogout()`**

Add before return:

```php
AdminAuth::clearTwoFactorSession();
```

- [ ] **Step 3: Update `verifyTwoFactor()`**

On success, replace DB `pass_2fa` update with:

```php
AdminAuth::markTwoFactorPassed($user);
Admin::where('id', $user->id)->update([
    'token_2fa' => null,
]);
```

Keep success email notification. Remove `token_2fa_expiry` and `pass_2fa` updates.

- [ ] **Step 4: Manual test**

Login with 2FA enabled → enter OTP → dashboard loads → refresh stays on dashboard.

---

### Task 4: Fix self-service profile 2FA form

**Files:**
- Modify: `resources/views/admin/Profile/profile.blade.php`
- Modify: `app/Http/Controllers/Admin/ManageAdminController.php` → `updateadminprofile()`

- [ ] **Step 1: Replace broken select in profile.blade.php**

```blade
<h5 class="">Two Factor Authentication</h5>
<select class="form-control" name="enable_2fa" required>
    <option value="disabled" @if(Auth('admin')->user()->enable_2fa !== 'enabled') selected @endif>Disable</option>
    <option value="enabled" @if(Auth('admin')->user()->enable_2fa === 'enabled') selected @endif>Enable</option>
</select><br>
```

- [ ] **Step 2: Validate in `updateadminprofile()`**

```php
$request->validate([
    'name' => 'required|string|max:255',
    'lname' => 'required|string|max:255',
    'phone' => 'required|string|max:255',
    'enable_2fa' => 'required|in:enabled,disabled',
]);

Admin::where('id', Auth('admin')->user()->id)->update([
    'firstName' => $request->name,
    'lastName' => $request->lname,
    'phone' => $request->phone,
    'enable_2fa' => $request->enable_2fa,
]);
```

- [ ] **Step 3: Manual test**

Enable 2FA on Conversion Agent profile only → confirm SQL shows only that row changed.

---

## Phase 2 — Root Super Admin Authority + Route Protection

### Task 5: Role middleware

**Files:**
- Create: `app/Http/Middleware/EnsureSuperAdmin.php`
- Create: `app/Http/Middleware/EnsureRootSuperAdmin.php`
- Modify: `app/Http/Kernel.php`

- [ ] **Step 1: Create `EnsureSuperAdmin.php`**

```php
public function handle(Request $request, Closure $next)
{
    $admin = Auth::guard('admin')->user();

    if (!$admin || $admin->type !== 'Super Admin') {
        abort(403, 'Super Admin access required.');
    }

    return $next($request);
}
```

- [ ] **Step 2: Create `EnsureRootSuperAdmin.php`**

```php
public function handle(Request $request, Closure $next)
{
    $admin = Auth::guard('admin')->user();

    if (!AdminAuth::isRootAdmin($admin)) {
        abort(403, 'Root Super Admin access required.');
    }

    return $next($request);
}
```

- [ ] **Step 3: Register in `Kernel.php` `$routeMiddleware`**

```php
'superadmin' => \App\Http\Middleware\EnsureSuperAdmin::class,
'rootadmin' => \App\Http\Middleware\EnsureRootSuperAdmin::class,
```

- [ ] **Step 4: Apply middleware in `routes/admin.php`**

Wrap existing manager routes (lines ~92–93, 177–186) with `superadmin`:

```php
Route::middleware(['isadmin', '2fa', 'superadmin'])->group(function () {
    Route::get('dashboard/addmanager', ...);
    Route::get('dashboard/madmin', ...);
    Route::get('dashboard/unblock/{id}', ...);
    Route::get('dashboard/ublock/{id}', ...);
    Route::get('dashboard/deleletadmin/{id}', ...);
    Route::post('dashboard/editadmin', ...);
    Route::post('dashboard/saveadmin', ...);
    Route::post('dashboard/sendmail', ...);
    Route::get('dashboard/resetadpwd/{id}', ...);
});
```

Add root-only 2FA routes:

```php
Route::middleware(['isadmin', '2fa', 'rootadmin'])->prefix('admin/dashboard')->group(function () {
    Route::post('admins/{admin}/2fa/toggle', [ManageAdminController::class, 'toggleAdminTwoFactor'])->name('admin.2fa.toggle');
    Route::post('admins/{admin}/2fa/reset', [ManageAdminController::class, 'resetAdminTwoFactor'])->name('admin.2fa.reset');
    Route::post('admins/{admin}/2fa/resend', [ManageAdminController::class, 'resendAdminTwoFactor'])->name('admin.2fa.resend');
});
```

---

### Task 6: Audit log migration and model

**Files:**
- Create: `database/migrations/2026_07_09_000001_create_admin_two_factor_logs_table.php`
- Create: `database/migrations/2026_07_09_000002_normalize_admin_enable_2fa_values.php`
- Create: `app/Models/AdminTwoFactorLog.php`

- [ ] **Step 1: Create logs migration**

```php
Schema::create('admin_two_factor_logs', function (Blueprint $table) {
    $table->id();
    $table->unsignedBigInteger('actor_admin_id');
    $table->unsignedBigInteger('target_admin_id');
    $table->string('action'); // enabled, disabled, reset, resend
    $table->string('ip_address', 45)->nullable();
    $table->timestamps();
});
```

- [ ] **Step 2: Create normalize migration**

```php
DB::table('admins')->where('enable_2fa', 'disbaled')->update(['enable_2fa' => 'disabled']);
DB::table('admins')->whereNotIn('enable_2fa', ['enabled', 'disabled'])->update(['enable_2fa' => 'disabled']);
```

- [ ] **Step 3: Run migrations**

Run: `php artisan migrate`
Expected: both migrations succeed

- [ ] **Step 4: Create `AdminTwoFactorLog` model** with `$fillable` for all columns

---

## Phase 3 — Root Super Admin Dashboard UI (Manage Admin(s))

### Task 7: Controller methods for root 2FA management

**Files:**
- Modify: `app/Http/Controllers/Admin/ManageAdminController.php`

**Interfaces:**
- Produces:
  - `toggleAdminTwoFactor(Request $request, Admin $target): RedirectResponse`
  - `resetAdminTwoFactor(Admin $target): RedirectResponse`
  - `resendAdminTwoFactor(Admin $target): RedirectResponse`
  - `logTwoFactorAction(int $actorId, int $targetId, string $action): void`

- [ ] **Step 1: Add private logger**

```php
private function logTwoFactorAction(int $actorId, int $targetId, string $action): void
{
    AdminTwoFactorLog::create([
        'actor_admin_id' => $actorId,
        'target_admin_id' => $targetId,
        'action' => $action,
        'ip_address' => request()->ip(),
    ]);
}
```

- [ ] **Step 2: Add `toggleAdminTwoFactor()`**

```php
public function toggleAdminTwoFactor(Request $request, Admin $admin)
{
    $request->validate(['enable_2fa' => 'required|in:enabled,disabled']);

    if (AdminAuth::isRootAdmin($admin)) {
        return back()->with('message', 'Cannot change root Super Admin 2FA from this panel.');
    }

    $admin->update([
        'enable_2fa' => $request->enable_2fa,
        'token_2fa' => null,
    ]);

    $this->logTwoFactorAction(auth('admin')->id(), $admin->id, $request->enable_2fa);

    return back()->with('success', '2FA setting updated for '.$admin->email);
}
```

- [ ] **Step 3: Add `resetAdminTwoFactor()`**

Clears `token_2fa` for target. Does not change `enable_2fa`. Logs `reset`.

- [ ] **Step 4: Add `resendAdminTwoFactor()`**

Only if target `enable_2fa === enabled'`. Generate new 5-digit code, save to `token_2fa`, send `Twofa` mailable. Throttle: max 3 per hour per target (use `RateLimiter` or cache key). Logs `resend`.

- [ ] **Step 5: Block root targeting self for disable**

Root can manage others only; optional: root manages own 2FA only via profile page.

---

### Task 8: Managers List dashboard UI

**Files:**
- Modify: `resources/views/admin/madmin.blade.php`
- Modify: `app/Http/Controllers/Admin/HomeController.php` → `madmin()`

- [ ] **Step 1: Add table column `2FA` after `STATUS`**

Display badge:
- `enabled` → green “Enabled”
- else → gray “Disabled”

- [ ] **Step 2: Add Actions dropdown items (root only)**

```blade
@if(\App\Support\AdminAuth::isRootAdmin(Auth('admin')->user()) && !\App\Support\AdminAuth::isRootAdmin($admin))
    <a href="#" data-toggle="modal" data-target="#twofaModal{{ $admin->id }}" class="m-1 btn btn-dark btn-sm">Manage 2FA</a>
@endif
```

- [ ] **Step 3: Add modal per admin row `#twofaModal{id}`**

Modal content:
- Current status (read)
- Form POST `route('admin.2fa.toggle')` with hidden `admin` id + select enabled/disabled
- Button POST reset → `route('admin.2fa.reset', $admin)`
- Button POST resend OTP → `route('admin.2fa.resend', $admin)` (only if enabled)
- Warning text: “Recovery actions are logged.”

- [ ] **Step 4: Add section header on madmin page (root only)**

```blade
@if(\App\Support\AdminAuth::isRootAdmin(Auth('admin')->user()))
    <div class="alert alert-info">
        As Root Super Admin, you can manage 2FA for all other staff accounts below.
    </div>
@endif
```

- [ ] **Step 5: Manual UI test**

Root sees “Manage 2FA” on each non-root row. Other Super Admin sees Managers List but no 2FA management buttons.

---

## Phase 4 — Tests and Hardening

### Task 9: Feature tests

**Files:**
- Create: `tests/Feature/AdminTwoFactorManagementTest.php`

- [ ] **Step 1: Test per-account profile update**

Conversion Agent enables 2FA → only that admin row has `enabled`.

- [ ] **Step 2: Test root can disable other admin 2FA**

Root POST toggle → target `enable_2fa = disabled` → log row created.

- [ ] **Step 3: Test non-root Super Admin gets 403 on toggle route**

- [ ] **Step 4: Test session 2FA gate**

Admin with 2FA enabled cannot access dashboard until verify sets session.

- [ ] **Step 5: Run tests**

Run: `php artisan test --filter=AdminTwoFactorManagementTest`
Expected: all PASS

---

## Master Implementation Checklist

### A. Configuration & foundation
- [ ] `config/admin.php` created with `root_id`
- [ ] `ADMIN_ROOT_ID=1` added to `.env` and `.env.example`
- [ ] `app/Support/AdminAuth.php` created
- [ ] Session keys: `admin_2fa_passed`, `admin_2fa_user_id`

### B. Per-account 2FA fix
- [ ] `TwoFactorVerify` uses session (not `pass_2fa` / `token_2fa_expiry`)
- [ ] Login clears session 2FA flags and regenerates session
- [ ] Logout clears session 2FA flags
- [ ] OTP verify sets session + clears `token_2fa`
- [ ] Profile form fixed (`enable_2fa` select with values)
- [ ] `updateadminprofile()` validates `in:enabled,disabled`
- [ ] DB typo `disbaled` normalized to `disabled`

### C. Root Super Admin authority
- [ ] `EnsureSuperAdmin` middleware created and registered
- [ ] `EnsureRootSuperAdmin` middleware created and registered
- [ ] Manager routes wrapped in `superadmin` middleware
- [ ] Root-only 2FA routes wrapped in `rootadmin` middleware
- [ ] Root cannot disable/manage own 2FA via recovery panel (profile only)

### D. Super Admin dashboard (Manage Admin(s))
- [ ] `madmin` table shows **2FA** status column for all rows
- [ ] Root sees **Manage 2FA** action per non-root admin
- [ ] Modal: Enable / Disable 2FA (write)
- [ ] Modal: Reset 2FA lock (write)
- [ ] Modal: Resend OTP email (write, if enabled)
- [ ] Info banner explains root recovery powers
- [ ] Live OTP never shown in UI

### E. Audit & security
- [ ] `admin_two_factor_logs` table migrated
- [ ] All root actions logged (actor, target, action, IP)
- [ ] Resend OTP rate-limited (3/hour/target)
- [ ] Non–Super Admin gets 403 on `/dashboard/madmin`
- [ ] Non-root gets 403 on 2FA recovery routes

### F. Testing & sign-off
- [ ] Conversion Agent 2FA on → only that account requires OTP
- [ ] Admin without 2FA → direct dashboard access
- [ ] Root disables locked-out agent → agent logs in without OTP
- [ ] Root resend OTP → email sent, new `token_2fa` in DB
- [ ] Feature tests pass
- [ ] End-user Fortify TOTP unchanged (smoke test `/login`)

---

## Manual Test Matrix

| # | Actor | Action | Expected |
|---|-------|--------|----------|
| 1 | Conversion Agent | Enable own 2FA on profile | Only that row `enable_2fa=enabled` |
| 2 | Admin (no 2FA) | Login | Dashboard, no `/admin/2fa` |
| 3 | Conversion Agent | Login with 2FA | Redirect `/admin/2fa`, OTP email sent |
| 4 | Conversion Agent | Enter correct OTP | Dashboard; session persists on refresh |
| 5 | Root Super Admin | Open Manage Admin(s) | 2FA column + Manage 2FA buttons visible |
| 6 | Other Super Admin | Open Manage Admin(s) | List visible; no Manage 2FA buttons |
| 7 | Root | Disable agent 2FA | Agent logs in without OTP |
| 8 | Root | Resend OTP to enabled agent | New email; new `token_2fa` in DB |
| 9 | Admin (non-root) | POST to toggle route directly | HTTP 403 |
| 10 | Root | Try manage own 2FA via modal | Blocked with message |

---

## Out of Scope (future)

- TOTP/authenticator app for admins (would need `pragmarx/google2fa`)
- Spatie roles/permissions refactor
- Global `settings.enable_2fa` enforcement
- SMS-based admin 2FA

---

## Execution Order Summary

1. Phase 1 (Tasks 1–4) — fix per-account 2FA bug
2. Phase 2 (Tasks 5–6) — middleware + audit DB
3. Phase 3 (Tasks 7–8) — root dashboard UI on Manage Admin(s)
4. Phase 4 (Task 9) — automated tests + sign-off checklist
