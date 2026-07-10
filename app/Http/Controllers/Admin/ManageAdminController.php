<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Settings;
use App\Models\Admin;
use App\Support\AdminAuth;
use App\Support\UserImpersonation;
use App\Mail\Twofa;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\RateLimiter;
use App\Mail\NewNotification;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class ManageAdminController extends Controller
{
    
   //block admin
    public function blockadmin($id){
        Admin::where('id',$id)
        ->update([
            'acnt_type_active' => 'blocked',
        ]);
        return redirect()->back()->with('success', 'Manager Blocked');
    }

    //unblock admin
    public function unblockadmin($id){
        Admin::where('id',$id)
        ->update([
            'acnt_type_active' => 'active',
        ]);
        return redirect()->back()->with('success', 'Manager Unblocked');
    }

    //Reset Password
    public function resetadpwd($id){
        $target = Admin::findOrFail($id);

        if (AdminAuth::isRootAdmin($target)) {
            return redirect()->back()->with('message', 'Cannot reset root Super Admin password from this panel.');
        }

        $plainPassword = Str::random(12);

        Admin::where('id', $target->id)->update([
            'password' => Hash::make($plainPassword),
        ]);

        $message = "Your admin account password was reset by an administrator.\n\n"
            ."New temporary password: {$plainPassword}\n\n"
            ."Please log in and change your password from Account Profile.";

        try {
            Mail::to($target->email)->send(new NewNotification(
                $message,
                'Your admin password was reset',
                $target->firstName
            ));

            return redirect()->back()->with(
                'success',
                "Password reset for {$target->firstName}. A new temporary password was emailed to {$target->email}."
            );
        } catch (\Throwable $e) {
            return redirect()->back()->with(
                'success',
                "Password reset for {$target->firstName}. Email could not be sent — share this temporary password securely: {$plainPassword}"
            );
        }
    }

    public function deleteadminacnt($id){
        Admin::where('id', $id)->delete();
        return redirect()->back()->with('success', 'Manager has been deleted!');
    }  

    //update admin info
    public function editadmin(Request $request){
        Admin::where('id', $request['user_id'])
        ->update([
            'firstName' => $request['fname'],
            'lastName' => $request['l_name'],
            'email' =>$request['email'], 
            'phone' =>$request['phone'], 
            'type' =>$request['type'], 
        ]);
        return redirect()->back()->with('success', 'Account updated Successfully!');
    }

     //Send mail to one user
     public function sendmail(Request $request){

        $mailduser=Admin::where('id',$request->user_id)->first();
        Mail::to($mailduser->email)->send(new NewNotification($request->message, $request->subject, $mailduser->firstname));
        return redirect()->back()->with('success','Your message was sent successfully!');
    } 

    public function adminchangepassword(){
        return view('admin.Profile.changepassword')->with(array(
            'title'=>'Change Password',
            'settings' => Settings::where('id', '=', '1')->first()
        ));
    }


       //Update Password
    public function adminupdatepass(Request $request){
        if(!password_verify($request['old_password'],$request['current_password']))
        {
          return redirect()->back()
          ->with('message', 'Incorrect Old Password');
        }
        $this->validate($request, [
            'password_confirmation' => 'same:password',
            'password' => 'min:8',
        ]);

        Admin::where('id', Auth('admin')->User()->id)
        ->update([
            'password' => Hash::make($request['password']),
        ]);
        return redirect()->back()
          ->with('success', 'Password Changed Sucessfully');
    } 

    public function changestyle(Request $request)
    {
        if(isset($request['style']) and $request['style']=='true'){
            $dashboard_style="dark";
        }else{
            $dashboard_style="light";
        }
        //change dashboard style
        Admin::where('id', Auth('admin')->User()->id)
        ->update([
            'dashboard_style' => $dashboard_style,
        ]);
        return response()->json(['success'=>'Changed']);
    }

    public function saveadmin(Request $request){

        $this->validate($request, [
            'fname' => 'required|max:255',
            'l_name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:admins',
            'password' => 'required|min:8|confirmed',
        ]);
    
        $thisid = DB::table('admins')->insertGetId([
            'firstName'=>$request['fname'],
            'lastName'=>$request['l_name'],
            'email'=>$request['email'],
            'phone'=>$request['phone'],
            'type'=>$request['type'],
            'acnt_type_active'=>"active",
            'status'=>"active",
            'dashboard_style'=> "light",
            'password'=> Hash::make($request['password']),
            'created_at'=>\Carbon\Carbon::now(),
            'updated_at'=>\Carbon\Carbon::now(),
        ]);
        return redirect()->back()
          ->with('success', 'Manager added Sucessfull!y');
    }

    public function updateadminprofile(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            'lname' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
            'enable_2fa' => 'required|in:enabled,disabled',
        ]);

        Admin::where('id', Auth('admin')->User()->id)
        ->update([
          'firstName' => $request->name,
          'lastName' => $request->lname,
          'phone' => $request->phone,
          'enable_2fa' => $request->enable_2fa,
        ]);
        return redirect()->back()
        ->with('success', "Action successful!.");
    }

    public function toggleAdminTwoFactor(Request $request, Admin $admin)
    {
        $request->validate([
            'enable_2fa' => 'required|in:enabled,disabled',
        ]);

        if (AdminAuth::isRootAdmin($admin)) {
            return back()->with('message', 'Cannot change root Super Admin 2FA from this panel.');
        }

        $admin->update([
            'enable_2fa' => $request->enable_2fa,
            'token_2fa' => null,
        ]);

        return back()->with('success', '2FA setting updated for '.$admin->email);
    }

    public function resetAdminTwoFactor(Admin $admin)
    {
        if (AdminAuth::isRootAdmin($admin)) {
            return back()->with('message', 'Cannot reset root Super Admin 2FA from this panel.');
        }

        $admin->update([
            'token_2fa' => null,
        ]);

        return back()->with('success', '2FA lock reset for '.$admin->email);
    }

    public function resendAdminTwoFactor(Admin $admin)
    {
        if (AdminAuth::isRootAdmin($admin)) {
            return back()->with('message', 'Cannot resend root Super Admin 2FA from this panel.');
        }

        if (AdminAuth::normalizeTwoFactorStatus($admin->enable_2fa) !== 'enabled') {
            return back()->with('message', '2FA is not enabled for '.$admin->email);
        }

        $rateLimitKey = 'admin-2fa-resend:'.$admin->id;

        if (RateLimiter::tooManyAttempts($rateLimitKey, 3)) {
            return back()->with('message', 'Too many OTP resend attempts. Try again later.');
        }

        RateLimiter::hit($rateLimitKey, 3600);

        $token = (string) mt_rand(10000, 99999);
        $admin->update(['token_2fa' => $token]);

        $settings = Settings::where('id', 1)->first();
        $objDemo = new \stdClass();
        $objDemo->message = $token;
        $objDemo->sender = $settings ? $settings->site_name : config('app.name');
        $objDemo->subject = 'Two Factor Code';
        $objDemo->date = \Carbon\Carbon::now();

        Mail::bcc($admin->email)->send(new Twofa($objDemo));

        return back()->with('success', 'A new 2FA code was sent to '.$admin->email);
    }

    public function updateStaffImpersonationPolicy(Request $request)
    {
        $request->validate([
            'allow_staff_user_impersonation' => 'required|in:0,1',
        ]);

        $enabled = $request->input('allow_staff_user_impersonation') === '1';

        Settings::where('id', 1)->update([
            'allow_staff_user_impersonation' => $enabled,
        ]);

        $status = $enabled ? 'enabled' : 'disabled';

        return back()->with(
            'success',
            "Staff customer login has been {$status}. Super Admins can always log in as customers."
        );
    }

    public function toggleStaffImpersonation(Request $request, Admin $admin)
    {
        if (UserImpersonation::isSuperAdmin($admin)) {
            return back()->with('message', 'Super Admin accounts always have customer login access. This setting applies to staff only.');
        }

        $request->validate([
            'can_impersonate_users' => 'required|in:0,1',
        ]);

        $allowed = $request->input('can_impersonate_users') === '1';

        $admin->update([
            'can_impersonate_users' => $allowed,
        ]);

        $name = trim($admin->firstName.' '.$admin->lastName);
        $status = $allowed ? 'granted' : 'revoked';

        return back()->with('success', "Customer login permission {$status} for {$name}.");
    }



}
