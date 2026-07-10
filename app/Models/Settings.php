<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Settings extends Model
{
    use HasFactory;

    protected $casts = [
        'return_capital' => 'boolean',
        'should_cancel_plan' => 'boolean',
        'modules' => 'array',
        'allow_staff_user_impersonation' => 'boolean',
    ];

    // public function getModulesAttribute($value)
    // {
    //     return ucfirst($value);
    // }
}