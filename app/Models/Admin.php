<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class Admin extends Authenticatable
{
    use HasFactory;
    protected $guard = 'admin';

    protected $fillable = [
        'firstName',
        'lastName',
        'email',
        'password',
        'phone',
        'dashboard_style',
        'acnt_type_active',
        'status',
        'type',
        'can_impersonate_users',
        'enable_2fa',
        'token_2fa',
        'pass_2fa',
        'token_2fa_expiry',
    ];
    
    protected $casts = [
        'can_impersonate_users' => 'boolean',
    ];
    
    protected $hidden = [
        'password', 'remember_token',
    ];
}
