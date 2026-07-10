<?php

namespace App\Support;

use App\Models\Admin;
use App\Models\Settings;

class UserImpersonation
{
    public const SESSION_KEY = 'impersonating_admin_id';

    public static function isSuperAdmin(?Admin $admin): bool
    {
        return $admin && $admin->type === 'Super Admin';
    }

    public static function staffAccessEnabled(): bool
    {
        $settings = Settings::find(1);

        return $settings && (bool) $settings->allow_staff_user_impersonation;
    }

    public static function adminCanImpersonate(?Admin $admin): bool
    {
        if (!$admin) {
            return false;
        }

        if (self::isSuperAdmin($admin)) {
            return true;
        }

        return self::staffAccessEnabled() && (bool) $admin->can_impersonate_users;
    }

    public static function denialMessage(?Admin $admin): string
    {
        if (!$admin) {
            return 'Please sign in to the admin dashboard before logging in as a customer.';
        }

        if (self::isSuperAdmin($admin)) {
            return 'Unable to log in as this customer. Please try again or contact support.';
        }

        if (!self::staffAccessEnabled()) {
            return 'Customer login is turned off for staff accounts. A Super Admin can enable it from Managers List → Staff customer login.';
        }

        if (!$admin->can_impersonate_users) {
            return 'Your account is not allowed to log in as customers. Ask a Super Admin to grant "Customer login" permission on the Managers list.';
        }

        return 'You do not have permission to log in as customers.';
    }

    public static function markSession(Admin $admin): void
    {
        session([self::SESSION_KEY => (int) $admin->id]);
    }

    public static function clearSession(): void
    {
        session()->forget(self::SESSION_KEY);
    }

    public static function impersonatorAdminId(): ?int
    {
        $id = session(self::SESSION_KEY);

        return $id ? (int) $id : null;
    }
}
