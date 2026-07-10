<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Models\Admin;
use App\Models\Settings;
use App\Support\AdminAuth;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Mail\Twofa;
use Illuminate\Support\Facades\Mail;

class LoginController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.adminlogin',[
            'title' => 'Admin Login',
            'settings' => Settings::where('id', '=', '1')->first(),
        ]);
    }

    public function adminlogin(Request $request)
    {
        $this->validate($request, [
            'email'    => 'required|email|exists:admins|min:5|max:191',
            'password' => 'required|string|min:4|max:255',
        ]);

        $email = $request->email;
        $password = $request->password;

        if (Auth::guard('admin')->attempt(['email' => $email, 'password' => $password, 'status' => 'active'])) {
            $request->session()->regenerate();
            AdminAuth::clearTwoFactorSession();

            $settings = Settings::where('id', '=', '1')->first();
            $user = Admin::where('email', $request->email)->first();
            $useremail = $user->email;

            if (AdminAuth::normalizeTwoFactorStatus($user->enable_2fa) === 'enabled') {
                $token = (string) mt_rand(10000, 99999);

                Admin::where('id', $user->id)->update([
                    'token_2fa' => $token,
                ]);

                $objDemo = new \stdClass();
                $objDemo->message = $token;
                $objDemo->sender = $settings->site_name;
                $objDemo->subject = 'Two Factor Code';
                $objDemo->date = \Carbon\Carbon::now();
                Mail::bcc($useremail)->send(new Twofa($objDemo));

                return redirect()->intended('/admin/2fa');
            }

            return redirect()->intended('admin/dashboard');
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ]);
    }

    public function validate_admin()
    {
        if (Auth::guard('admin')->check()) {
            return redirect()
                ->intended(route('admin.dashboard'))
                ->with('message', 'You are Logged in as Admin!');
        }

        return redirect()
            ->route('adminloginform')
            ->with('message', 'Not allowed');
    }

    public function adminlogout(Request $request)
    {
        AdminAuth::clearTwoFactorSession();
        Auth::guard('admin')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()
            ->route('adminloginform')
            ->with('status', 'Admin has been logged out!');
    }
}
