<?php
namespace App\Http\Middleware;

use App\Models\Admin;
use App\Support\AdminAuth;
use Closure;
use Illuminate\Support\Facades\Auth;

class TwoFactorVerify
{
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
}
