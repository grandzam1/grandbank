<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class SettingsSeeder extends Seeder
{
    public function run()
    {
        $now = now();

        $settings = [
            'site_name' => 'GrandBank',
            'site_title' => 'GrandBank Online Banking',
            'site_address' => 'http://localhost/grandbank',
            'install_type' => 'Sub-Folder',
            'website_theme' => 'blue.css',
            'currency' => '$',
            'scurrency' => 'USD',
            'contact_email' => 'support@grandbank.test',
            'description' => 'GrandBank administration portal',
            'logo' => null,
            'favicon' => null,
            'enable_2fa' => 'no',
            'enable_kyc' => 'no',
            'enable_verification' => 'true',
            'withdrawal_option' => 'manual',
            'dashboard_option' => 'dark',
            'modules' => json_encode([
                'signal' => false,
                'cryptoswap' => false,
                'investment' => true,
                'membership' => false,
                'subscription' => true,
            ]),
            'updated_at' => $now,
            'created_at' => $now,
        ];

        $settings = array_intersect_key(
            $settings,
            array_flip(Schema::getColumnListing('settings'))
        );

        DB::table('settings')->updateOrInsert(['id' => 1], $settings);

        if (Schema::hasTable('settings_conts')) {
            DB::table('settings_conts')->updateOrInsert(
                ['id' => 1],
                [
                    'use_crypto_feature' => true,
                    'updated_at' => $now,
                    'created_at' => $now,
                ]
            );
        }

        if (Schema::hasTable('paystacks')) {
            DB::table('paystacks')->updateOrInsert(
                ['id' => 1],
                [
                    'paystack_public_key' => null,
                    'paystack_secret_key' => null,
                    'paystack_url' => 'https://api.paystack.co',
                    'paystack_email' => 'test@grandbank.test',
                    'updated_at' => $now,
                    'created_at' => $now,
                ]
            );
        }

        $this->command->info('Settings restored for GrandBank local development.');
    }
}
