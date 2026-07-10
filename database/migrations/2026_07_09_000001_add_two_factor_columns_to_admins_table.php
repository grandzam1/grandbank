<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class AddTwoFactorColumnsToAdminsTable extends Migration
{
    public function up()
    {
        Schema::table('admins', function (Blueprint $table) {
            if (!Schema::hasColumn('admins', 'enable_2fa')) {
                $table->string('enable_2fa')->default('disabled');
            }
            if (!Schema::hasColumn('admins', 'token_2fa')) {
                $table->string('token_2fa')->nullable();
            }
            if (!Schema::hasColumn('admins', 'pass_2fa')) {
                $table->string('pass_2fa')->nullable();
            }
            if (!Schema::hasColumn('admins', 'token_2fa_expiry')) {
                $table->dateTime('token_2fa_expiry')->nullable();
            }
        });

        DB::table('admins')->where('enable_2fa', 'disbaled')->update(['enable_2fa' => 'disabled']);
        DB::table('admins')
            ->whereNotIn('enable_2fa', ['enabled', 'disabled'])
            ->update(['enable_2fa' => 'disabled']);
    }

    public function down()
    {
        Schema::table('admins', function (Blueprint $table) {
            if (Schema::hasColumn('admins', 'enable_2fa')) {
                $table->dropColumn('enable_2fa');
            }
            if (Schema::hasColumn('admins', 'token_2fa')) {
                $table->dropColumn('token_2fa');
            }
            if (Schema::hasColumn('admins', 'pass_2fa')) {
                $table->dropColumn('pass_2fa');
            }
            if (Schema::hasColumn('admins', 'token_2fa_expiry')) {
                $table->dropColumn('token_2fa_expiry');
            }
        });
    }
}
