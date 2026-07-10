<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddStaffUserImpersonationSettings extends Migration
{
    public function up()
    {
        Schema::table('settings', function (Blueprint $table) {
            if (!Schema::hasColumn('settings', 'allow_staff_user_impersonation')) {
                $table->boolean('allow_staff_user_impersonation')->default(false)->after('modules');
            }
        });

        Schema::table('admins', function (Blueprint $table) {
            if (!Schema::hasColumn('admins', 'can_impersonate_users')) {
                $table->boolean('can_impersonate_users')->default(false)->after('type');
            }
        });
    }

    public function down()
    {
        Schema::table('settings', function (Blueprint $table) {
            if (Schema::hasColumn('settings', 'allow_staff_user_impersonation')) {
                $table->dropColumn('allow_staff_user_impersonation');
            }
        });

        Schema::table('admins', function (Blueprint $table) {
            if (Schema::hasColumn('admins', 'can_impersonate_users')) {
                $table->dropColumn('can_impersonate_users');
            }
        });
    }
}
