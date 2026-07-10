<?php

namespace App\Support;

use App\Models\Admin;
use App\Models\User;
use Illuminate\Database\Eloquent\Builder;

class AdminUserAccess
{
    public static function isSuperAdmin(?Admin $admin): bool
    {
        return $admin && $admin->type === 'Super Admin';
    }

    public static function scopeForAdmin(Builder $query, ?Admin $admin): Builder
    {
        if (! $admin || self::isSuperAdmin($admin)) {
            return $query;
        }

        return $query->where('assign_to', $admin->id);
    }

    public static function scopeRelationForAdmin(Builder $query, string $relation, ?Admin $admin): Builder
    {
        if (! $admin || self::isSuperAdmin($admin)) {
            return $query;
        }

        return $query->whereHas($relation, function (Builder $userQuery) use ($admin) {
            self::scopeForAdmin($userQuery, $admin);
        });
    }

    public static function canAccessUser(?Admin $admin, int $userId): bool
    {
        if (! $admin) {
            return false;
        }

        if (self::isSuperAdmin($admin)) {
            return true;
        }

        return User::where('id', $userId)
            ->where('assign_to', $admin->id)
            ->exists();
    }

    public static function authorizeUserAccess(?Admin $admin, int $userId): void
    {
        if (! self::canAccessUser($admin, $userId)) {
            abort(403, 'You do not have access to this customer account.');
        }
    }

    public static function assignableStaff()
    {
        return Admin::query()
            ->where('type', '!=', 'Super Admin')
            ->where(function (Builder $query) {
                $query->whereNull('acnt_type_active')
                    ->orWhere('acnt_type_active', 'active');
            })
            ->orderBy('firstName')
            ->orderBy('lastName')
            ->get();
    }
}
