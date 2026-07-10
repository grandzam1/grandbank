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
