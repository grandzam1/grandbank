<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class AlignSettingsTableWithApplication extends Migration
{
    /**
     * Add columns expected by admin settings controllers but missing from
     * partial migrations / SQL data-only restores.
     */
    public function up()
    {
        if (!Schema::hasTable('settings')) {
            return;
        }

        $this->shrinkRowSizeForNewColumns();

        $columns = [
            ['code1', fn (Blueprint $t) => $t->string('code1', 25)->nullable()],
            ['code2', fn (Blueprint $t) => $t->string('code2', 25)->nullable()],
            ['code3', fn (Blueprint $t) => $t->string('code3', 25)->nullable()],
            ['code4', fn (Blueprint $t) => $t->string('code4', 25)->nullable()],
            ['code1status', fn (Blueprint $t) => $t->integer('code1status')->default(1)],
            ['code2status', fn (Blueprint $t) => $t->integer('code2status')->default(1)],
            ['code3status', fn (Blueprint $t) => $t->integer('code3status')->default(1)],
            ['code1message', fn (Blueprint $t) => $t->text('code1message')->nullable()],
            ['code2message', fn (Blueprint $t) => $t->text('code2message')->nullable()],
            ['code3message', fn (Blueprint $t) => $t->text('code3message')->nullable()],
            ['otp', fn (Blueprint $t) => $t->integer('otp')->default(0)],
            ['sms', fn (Blueprint $t) => $t->integer('sms')->default(0)],
            ['merchant_key', fn (Blueprint $t) => $t->string('merchant_key', 192)->nullable()],
            ['welcome_message', fn (Blueprint $t) => $t->text('welcome_message')->nullable()],
            ['whatsapp', fn (Blueprint $t) => $t->string('whatsapp', 100)->nullable()],
            ['tido', fn (Blueprint $t) => $t->string('tido', 100)->nullable()],
            ['address', fn (Blueprint $t) => $t->text('address')->nullable()],
            ['address_o', fn (Blueprint $t) => $t->string('address_o', 191)->nullable()],
            ['intreast', fn (Blueprint $t) => $t->integer('intreast')->nullable()],
            ['deposit_bonus', fn (Blueprint $t) => $t->integer('deposit_bonus')->nullable()],
            ['enable_kyc_registration', fn (Blueprint $t) => $t->string('enable_kyc_registration', 50)->nullable()],
            ['enable_social_login', fn (Blueprint $t) => $t->string('enable_social_login', 50)->nullable()],
            ['deposit_option', fn (Blueprint $t) => $t->string('deposit_option', 50)->nullable()],
            ['auto_merchant_option', fn (Blueprint $t) => $t->string('auto_merchant_option', 50)->nullable()],
            ['subscription_service', fn (Blueprint $t) => $t->text('subscription_service')->nullable()],
            ['return_capital', fn (Blueprint $t) => $t->boolean('return_capital')->default(true)],
            ['should_cancel_plan', fn (Blueprint $t) => $t->boolean('should_cancel_plan')->default(true)],
            ['redirect_url', fn (Blueprint $t) => $t->string('redirect_url', 192)->nullable()],
            ['credit_card_provider', fn (Blueprint $t) => $t->string('credit_card_provider', 50)->nullable()],
            ['deduction_option', fn (Blueprint $t) => $t->string('deduction_option', 50)->nullable()],
            ['s_currency', fn (Blueprint $t) => $t->string('s_currency', 10)->nullable()],
        ];

        foreach ($columns as [$name, $definition]) {
            if (Schema::hasColumn('settings', $name)) {
                continue;
            }

            Schema::table('settings', function (Blueprint $table) use ($definition) {
                $definition($table);
            });
        }

        if (Schema::hasColumn('settings', 'scurrency') && Schema::hasColumn('settings', 's_currency')) {
            DB::table('settings')
                ->whereNull('s_currency')
                ->whereNotNull('scurrency')
                ->update(['s_currency' => DB::raw('scurrency')]);
        }
    }

    /**
     * InnoDB row-size limit: convert wide VARCHAR columns to TEXT so new columns can be added.
     */
    private function shrinkRowSizeForNewColumns(): void
    {
        $convertToText = [
            'site_name', 'currency', 'scurrency', 'bank_name', 'account_name', 'account_number',
            'eth_address', 'btc_address', 'ltc_address', 'payment_mode', 'location',
            's_s_k', 's_p_k', 'pp_cs', 'pp_ci', 'keywords', 'site_title', 'site_address',
            'logo', 'favicon', 'trade_mode', 'weekend_trade', 'google_translate', 'captcha',
            'contact_email', 'referral_commission', 'referral_commission1', 'referral_commission2',
            'referral_commission3', 'referral_commission4', 'referral_commission5', 'signup_bonus',
            'files_key', 'enable_2fa', 'enable_kyc', 'enable_with', 'enable_verification',
            'withdrawal_option', 'dashboard_option', 'site_preference', 'enable_annoc',
            'commission_type', 'commission_fee', 'monthlyfee', 'quarterlyfee', 'yearlyfee',
            'newupdate', 'updated_by', 'website_theme', 'install_type', 'timezone',
            'smtp_host', 'smtp_port', 'smtp_encrypt', 'smtp_user', 'smtp_password',
            'mail_server', 'emailfrom', 'emailfromname', 'capt_secret', 'capt_sitekey',
            'google_id', 'google_secret', 'google_redirect',
        ];

        foreach ($convertToText as $column) {
            if (!Schema::hasColumn('settings', $column)) {
                continue;
            }

            DB::statement("ALTER TABLE `settings` MODIFY `{$column}` TEXT NULL");
        }
    }

    public function down()
    {
        if (!Schema::hasTable('settings')) {
            return;
        }

        foreach ([
            'code1', 'code2', 'code3', 'code4',
            'code1status', 'code2status', 'code3status',
            'code1message', 'code2message', 'code3message',
            'otp', 'sms', 'merchant_key', 'welcome_message',
            'whatsapp', 'tido', 'address', 'address_o',
            'intreast', 'deposit_bonus', 'enable_kyc_registration',
            'enable_social_login', 'deposit_option', 'auto_merchant_option',
            'subscription_service', 'return_capital', 'should_cancel_plan',
            'redirect_url', 'credit_card_provider', 'deduction_option', 's_currency',
        ] as $column) {
            if (!Schema::hasColumn('settings', $column)) {
                continue;
            }

            Schema::table('settings', function (Blueprint $table) use ($column) {
                $table->dropColumn($column);
            });
        }
    }
}
