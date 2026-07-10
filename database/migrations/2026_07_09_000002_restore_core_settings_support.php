<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RestoreCoreSettingsSupport extends Migration
{
    public function up()
    {
        if (Schema::hasTable('settings')) {
            Schema::table('settings', function (Blueprint $table) {
                if (!Schema::hasColumn('settings', 'website_theme')) {
                    $table->string('website_theme')->default('blue.css');
                }
                if (!Schema::hasColumn('settings', 'install_type')) {
                    $table->string('install_type')->nullable();
                }
                if (!Schema::hasColumn('settings', 'timezone')) {
                    $table->string('timezone')->nullable();
                }
                if (!Schema::hasColumn('settings', 'smtp_host')) {
                    $table->string('smtp_host')->nullable();
                }
                if (!Schema::hasColumn('settings', 'smtp_port')) {
                    $table->string('smtp_port')->nullable();
                }
                if (!Schema::hasColumn('settings', 'smtp_encrypt')) {
                    $table->string('smtp_encrypt')->nullable();
                }
                if (!Schema::hasColumn('settings', 'smtp_user')) {
                    $table->string('smtp_user')->nullable();
                }
                if (!Schema::hasColumn('settings', 'smtp_password')) {
                    $table->string('smtp_password')->nullable();
                }
                if (!Schema::hasColumn('settings', 'mail_server')) {
                    $table->string('mail_server')->nullable();
                }
                if (!Schema::hasColumn('settings', 'emailfrom')) {
                    $table->string('emailfrom')->nullable();
                }
                if (!Schema::hasColumn('settings', 'emailfromname')) {
                    $table->string('emailfromname')->nullable();
                }
                if (!Schema::hasColumn('settings', 'capt_secret')) {
                    $table->string('capt_secret')->nullable();
                }
                if (!Schema::hasColumn('settings', 'capt_sitekey')) {
                    $table->string('capt_sitekey')->nullable();
                }
                if (!Schema::hasColumn('settings', 'google_id')) {
                    $table->string('google_id')->nullable();
                }
                if (!Schema::hasColumn('settings', 'google_secret')) {
                    $table->string('google_secret')->nullable();
                }
                if (!Schema::hasColumn('settings', 'google_redirect')) {
                    $table->string('google_redirect')->nullable();
                }
                if (!Schema::hasColumn('settings', 'modules')) {
                    $table->longText('modules')->nullable();
                }
            });
        }

        if (!Schema::hasTable('paystacks')) {
            Schema::create('paystacks', function (Blueprint $table) {
                $table->id();
                $table->text('paystack_public_key')->nullable();
                $table->text('paystack_secret_key')->nullable();
                $table->string('paystack_url')->nullable();
                $table->string('paystack_email')->nullable();
                $table->timestamps();
            });
        }
    }

    public function down()
    {
        Schema::dropIfExists('paystacks');

        if (Schema::hasTable('settings')) {
            Schema::table('settings', function (Blueprint $table) {
                foreach ([
                    'website_theme',
                    'install_type',
                    'timezone',
                    'smtp_host',
                    'smtp_port',
                    'smtp_encrypt',
                    'smtp_user',
                    'smtp_password',
                    'mail_server',
                    'emailfrom',
                    'emailfromname',
                    'capt_secret',
                    'capt_sitekey',
                    'google_id',
                    'google_secret',
                    'google_redirect',
                    'modules',
                ] as $column) {
                    if (Schema::hasColumn('settings', $column)) {
                        $table->dropColumn($column);
                    }
                }
            });
        }
    }
}
