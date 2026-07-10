<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Root Super Admin
    |--------------------------------------------------------------------------
    |
    | The primary Super Admin account that can manage other staff accounts'
    | two-factor authentication settings for recovery.
    |
    */

    'root_id' => (int) env('ADMIN_ROOT_ID', 1),

];
