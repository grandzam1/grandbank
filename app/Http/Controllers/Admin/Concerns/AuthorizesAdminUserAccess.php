<?php

namespace App\Http\Controllers\Admin\Concerns;

use App\Support\AdminUserAccess;
use Illuminate\Support\Facades\Auth;

trait AuthorizesAdminUserAccess
{
    protected function authorizeAdminUserAccess(int $userId): void
    {
        AdminUserAccess::authorizeUserAccess(Auth::guard('admin')->user(), $userId);
    }

    protected function currentAdmin()
    {
        return Auth::guard('admin')->user();
    }
}
