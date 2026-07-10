<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use App\Models\Settings;
use App\Models\Admin;
use Laravel\Sanctum\HasApiTokens;
use App\Support\AdminUserAccess;
use Illuminate\Database\Eloquent\Builder;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use Notifiable;
    use TwoFactorAuthenticatable;
   
    /**
     * Send the email verification notification.
     *
     * @return void
     */

    public function sendEmailVerificationNotification()
    {
        $settings = Settings::where('id', 1)->first();

        if ($settings->enable_verification == 'true') {
            $this->notify(new VerifyEmail);
        }
        
    }
    
    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'profile_photo_url',
    ];

    /**
     * Profile photos are stored in storage/photos and served
     * from the app root (not via site_address / remote domain).
     */
    public function getProfilePhotoUrlAttribute()
    {
        if (empty($this->profile_photo_path)) {
            $name = trim(($this->name ?? '') . ' ' . ($this->lastname ?? ''));

            return 'https://ui-avatars.com/api/?name=' . urlencode($name !== '' ? $name : 'User') . '&background=random';
        }

        if (str_starts_with($this->profile_photo_path, 'http://') || str_starts_with($this->profile_photo_path, 'https://')) {
            return $this->profile_photo_path;
        }

        $path = ltrim($this->profile_photo_path, '/');
        if (! str_starts_with($path, 'photos/')) {
            $path = 'photos/' . $path;
        }

        return asset('storage/' . $path);
    }

    public function dp(){
    	return $this->hasMany(Deposit::class, 'user');
    }

    public function wd(){
    	return $this->hasMany(Withdrawal::class, 'user');
    }

    public function tuser(){
    	return $this->belongsTo(Admin::class, 'assign_to');
    }

    public function assignedAdmin()
    {
        return $this->belongsTo(Admin::class, 'assign_to');
    }

    public function scopeVisibleToAdmin(Builder $query, ?Admin $admin): Builder
    {
        return AdminUserAccess::scopeForAdmin($query, $admin);
    }
    
    public function dplan(){
    	return $this->belongsTo(Plans::class, 'plan');
    }

    public function plans(){
        return $this->hasMany(User_plans::class,'user', 'id');
    }

    public static function search($search): \Illuminate\Database\Eloquent\Builder
    {
        return empty($search) ? static::query()
        : static::query()->where('id', 'like', '%'.$search.'%')
        ->orWhere('name', 'like', '%'.$search.'%')
        ->orWhere('username', 'like', '%'.$search.'%')
        ->orWhere('email', 'like', '%'.$search.'%');
    }
	
    /**
     * Get the cards for the user.
     */
    public function cards()
    {
        return $this->hasMany(Card::class);
    }

    /**
     * Get the notifications associated with the user.
     */
    public function notifications()
    {
        return $this->hasMany(Notification::class);
    }

    /**
     * Get the count of unread notifications for this user.
     * 
     * @return int
     */
    public function unreadNotificationsCount()
    {
        return $this->notifications()->where('is_read', false)->count();
    }
}
