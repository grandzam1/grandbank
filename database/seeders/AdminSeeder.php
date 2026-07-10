<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Restore default admin staff accounts for local development.
     *
     * Default password for all seeded accounts: admin01236
     */
    public function run()
    {
        $password = Hash::make('admin01236');
        $now = now();

        $accounts = [
            [
                'id' => 1,
                'firstName' => 'Admin',
                'lastName' => 'manager',
                'email' => 'admin@admin.com',
                'password' => $password,
                'phone' => '34444443',
                'dashboard_style' => 'light',
                'acnt_type_active' => 'active',
                'status' => 'active',
                'type' => 'Super Admin',
                'enable_2fa' => 'disabled',
                'token_2fa' => null,
                'pass_2fa' => null,
                'token_2fa_expiry' => null,
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'firstName' => 'Staff',
                'lastName' => 'Admin',
                'email' => 'staff@grandbank.test',
                'password' => $password,
                'phone' => '1000000001',
                'dashboard_style' => 'light',
                'acnt_type_active' => 'active',
                'status' => 'active',
                'type' => 'Admin',
                'enable_2fa' => 'disabled',
                'token_2fa' => null,
                'pass_2fa' => null,
                'token_2fa_expiry' => null,
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'firstName' => 'Conversion',
                'lastName' => 'Agent',
                'email' => 'agent@grandbank.test',
                'password' => $password,
                'phone' => '1000000002',
                'dashboard_style' => 'light',
                'acnt_type_active' => 'active',
                'status' => 'active',
                'type' => 'Conversion Agent',
                'enable_2fa' => 'disabled',
                'token_2fa' => null,
                'pass_2fa' => null,
                'token_2fa_expiry' => null,
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'firstName' => 'Secondary',
                'lastName' => 'SuperAdmin',
                'email' => 'super2@grandbank.test',
                'password' => $password,
                'phone' => '1000000003',
                'dashboard_style' => 'light',
                'acnt_type_active' => 'active',
                'status' => 'active',
                'type' => 'Super Admin',
                'enable_2fa' => 'disabled',
                'token_2fa' => null,
                'pass_2fa' => null,
                'token_2fa_expiry' => null,
                'created_at' => $now,
                'updated_at' => $now,
            ],
        ];

        foreach ($accounts as $account) {
            if (isset($account['id'])) {
                $id = $account['id'];
                unset($account['id']);

                DB::table('admins')->updateOrInsert(
                    ['id' => $id],
                    $account
                );

                continue;
            }

            DB::table('admins')->updateOrInsert(
                ['email' => $account['email']],
                $account
            );
        }

        $this->command->info('Admin accounts seeded.');
        $this->command->line('Root Super Admin (id=1): admin@admin.com / admin01236');
        $this->command->line('Admin: staff@grandbank.test / admin01236');
        $this->command->line('Conversion Agent: agent@grandbank.test / admin01236');
        $this->command->line('Other Super Admin: super2@grandbank.test / admin01236');
    }
}
