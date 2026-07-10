<?php

namespace App\Http\Middleware;

use App\Support\AdminAuth;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EnsureRootSuperAdmin
{
    public function handle(Request $request, Closure $next)
    {
        $admin = Auth::guard('admin')->user();

        if (!AdminAuth::isRootAdmin($admin)) {
            abort(403, 'Root Super Admin access required.');
        }

        return $next($request);
    }
}
