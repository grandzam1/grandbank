# GrandBank Admin 2FA — Implementation Checklist

Track progress for per-account admin 2FA and root Super Admin recovery controls.

**Project:** `C:\xampp\htdocs\grandbank`  
**Root Super Admin:** `ADMIN_ROOT_ID=1` (default Super Admin account)  
**Full plan:** [docs/superpowers/plans/2026-07-09-admin-2fa-super-admin-management.md](superpowers/plans/2026-07-09-admin-2fa-super-admin-management.md)

---

## A. Configuration & foundation

- [x] `config/admin.php` created with `root_id`
- [ ] `ADMIN_ROOT_ID=1` added to `.env` (manual — config defaults to `1` if omitted)
- [x] `app/Support/AdminAuth.php` created
- [x] Session keys: `admin_2fa_passed`, `admin_2fa_user_id`
- [x] `EnsureSuperAdmin` middleware created
- [x] `EnsureRootSuperAdmin` middleware created
- [x] Middleware registered in `app/Http/Kernel.php` (`superadmin`, `rootadmin`)

---

## B. Per-account 2FA fix

- [x] `TwoFactorVerify` uses session (not `pass_2fa` / `token_2fa_expiry`)
- [x] Login clears session 2FA flags and regenerates session
- [x] Logout clears session 2FA flags
- [x] OTP verify sets session + clears `token_2fa`
- [x] Profile form fixed (`enable_2fa` select with explicit values)
- [x] `updateadminprofile()` validates `in:enabled,disabled`
- [x] Migration: `2026_07_09_000001_add_two_factor_columns_to_admins_table.php`
- [x] DB typo `disbaled` normalized to `disabled`
- [ ] Re-import admin data if `admins` table is empty — run `php artisan db:seed --class=AdminSeeder`
- [x] Settings restored — run `php artisan db:seed --class=SettingsSeeder`

---

## C. Root Super Admin authority (backend)

- [x] `superadmin` middleware on manager routes (`madmin`, `addmanager`, `editadmin`, etc.)
- [x] `rootadmin` middleware on 2FA recovery routes
- [x] `toggleAdminTwoFactor()` — enable/disable for other admins
- [x] `resetAdminTwoFactor()` — clear stuck OTP state
- [x] `resendAdminTwoFactor()` — new email OTP (rate limited 3/hour)
- [x] Root cannot manage own 2FA via recovery routes (blocked in controller)
- [x] Unit tests: `tests/Unit/AdminAuthTest.php` (3/3 pass)

---

## D. Super Admin dashboard UI (Manage Admin(s))

- [x] `madmin` table shows **2FA** status column
- [x] Root sees **Manage 2FA** action per non-root admin
- [x] Modal: Enable / Disable 2FA
- [x] Modal: Reset 2FA lock
- [x] Modal: Resend OTP email
- [x] Info banner: root recovery powers explained
- [x] Live OTP never shown in UI

---

## E. Audit & security

- [ ] `admin_two_factor_logs` table migrated
- [ ] All root 2FA actions logged (actor, target, action, IP)
- [x] Resend OTP rate-limited (3/hour/target) — in controller
- [x] Non–Super Admin gets 403 on manager routes — middleware
- [x] Non-root gets 403 on recovery routes — middleware
- [ ] Feature tests with isolated test DB (sqlite `:memory:`)

---

## F. Testing & sign-off

- [x] Unit tests pass (`php artisan test tests/Unit/AdminAuthTest.php`)
- [ ] Feature tests pass (needs sqlite test DB or safe test setup)
- [ ] Conversion Agent 2FA on → only that account requires OTP
- [ ] Admin without 2FA → direct dashboard access
- [ ] Root disables locked-out agent → agent logs in without OTP
- [ ] Root resend OTP → email sent, new `token_2fa` in DB
- [ ] End-user Fortify TOTP unchanged (smoke test `/login`)

---

## Manual test matrix

| # | Scenario | Expected | Done |
|---|----------|----------|------|
| 1 | Conversion Agent enables own 2FA on profile | Only that row `enable_2fa=enabled` | [ ] |
| 2 | Admin without 2FA logs in | Dashboard, no `/admin/2fa` | [ ] |
| 3 | Agent with 2FA logs in | Redirect `/admin/2fa`, OTP email sent | [ ] |
| 4 | Correct OTP entered | Dashboard; refresh stays in | [ ] |
| 5 | Root opens Manage Admin(s) | 2FA column + Manage 2FA buttons (after Phase D) | [ ] |
| 6 | Other Super Admin opens Manage Admin(s) | List visible; no Manage 2FA buttons | [ ] |
| 7 | Root disables agent 2FA | Agent logs in without OTP | [ ] |
| 8 | Root resends OTP to enabled agent | New email; new `token_2fa` in DB | [ ] |
| 9 | Non-root POSTs toggle URL directly | HTTP 403 | [ ] |
| 10 | Root tries own 2FA via recovery panel | Blocked with message | [ ] |

---

## Useful commands

```bash
# Run unit tests
php artisan test tests/Unit/AdminAuthTest.php

# Apply 2FA columns migration (if not yet run)
php artisan migrate --path=database/migrations/2026_07_09_000001_add_two_factor_columns_to_admins_table.php --force

# Verify admin 2FA columns and data
php artisan tinker --execute="print_r(DB::table('admins')->select('id','email','type','enable_2fa')->get()->toArray());"

# Clear config after .env change
php artisan config:clear
```

---

## Important notes

1. **Re-import admins** if the table is empty after accidental test DB refresh:
   - Import `database/bank_2026-07-04.sql` via phpMyAdmin, or
   - Re-create admin accounts manually.

2. **Add to `.env`:**
   ```
   ADMIN_ROOT_ID=1
   ```

3. **Phases A–D** complete. Run `php artisan db:seed --class=AdminSeeder` if admins table is empty.

4. **Do not use `RefreshDatabase`** in feature tests against the local `bank` MySQL database — it can wipe development data.

5. **Seeded login accounts** (password for all: `admin01236`):
   - Root Super Admin: `admin@admin.com` (id=1)
   - Admin: `staff@grandbank.test`
   - Conversion Agent: `agent@grandbank.test`
   - Other Super Admin: `super2@grandbank.test`
