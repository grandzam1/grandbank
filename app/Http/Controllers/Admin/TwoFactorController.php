<?php

namespace App\Http\Controllers\Admin;

use App\Models\Settings;
use App\Models\Admin;
use App\Support\AdminAuth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Mail\NewNotification;
use Illuminate\Support\Facades\Mail;

class TwoFactorController extends Controller
{
    public function verifyTwoFactor(Request $request)
    {
        $request->validate([
            'twofa' => 'required',
        ]);

        $user = Auth('admin')->user();

        if ((string) $request->twofa === (string) $user->token_2fa) {
            AdminAuth::markTwoFactorPassed($user);

            Admin::where('id', $user->id)->update([
                'token_2fa' => null,
            ]);

            $message = 'This is a successful login notification on your admin account. If this was not you, kindly take action by changing your account password.';
            $subject = 'Successful login';

            Mail::bcc($user->email)->send(new NewNotification($message, $subject, $user->email));
            $request->session()->forget('twofa');

            return redirect('/admin/dashboard');
        }

        return redirect()->back()->with('message', 'Incorrect code.');
    }

    public function showTwoFactorForm()
    {
        return view('auth.two_factor', [
            'title' => 'Admin Two Factor Authentication',
            'settings' => Settings::where('id', '=', '1')->first(),
        ]);
    }
}
