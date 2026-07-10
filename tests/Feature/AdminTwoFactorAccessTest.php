<?php

namespace Tests\Feature;

use App\Models\Admin;
use App\Support\AdminAuth;
use Illuminate\Support\Facades\Hash;
use Tests\TestCase;

class AdminTwoFactorAccessTest extends TestCase
{
    /**
     * Uses the configured application database. Do not use RefreshDatabase here
     * because this project shares a local MySQL schema with development data.
     */

    private function createAdmin(array $overrides = []): Admin
    {
        return Admin::create(array_merge([
            'firstName' => 'Test',
            'lastName' => 'Admin',
            'email' => 'test-'.uniqid().'@example.com',
            'password' => Hash::make('password'),
            'phone' => '1234567890',
            'dashboard_style' => 'light',
            'acnt_type_active' => 'active',
            'status' => 'active',
            'type' => 'Super Admin',
            'enable_2fa' => 'disabled',
        ], $overrides));
    }

    public function test_profile_update_only_changes_logged_in_admin_two_factor_setting()
    {
        $agent = $this->createAdmin([
            'email' => 'agent@example.com',
            'type' => 'Conversion Agent',
            'enable_2fa' => 'disabled',
        ]);

        $other = $this->createAdmin([
            'email' => 'other@example.com',
            'type' => 'Admin',
            'enable_2fa' => 'disabled',
        ]);

        $response = $this->actingAs($agent, 'admin')->post(route('upadprofile'), [
            'name' => $agent->firstName,
            'lname' => $agent->lastName,
            'phone' => $agent->phone,
            'enable_2fa' => 'enabled',
        ]);

        $response->assertRedirect();
        $this->assertSame('enabled', $agent->fresh()->enable_2fa);
        $this->assertSame('disabled', $other->fresh()->enable_2fa);
    }

    public function test_two_factor_middleware_redirects_when_session_not_verified()
    {
        $admin = $this->createAdmin([
            'email' => 'secured@example.com',
            'enable_2fa' => 'enabled',
        ]);

        $response = $this->actingAs($admin, 'admin')->get(route('admin.dashboard'));

        $response->assertRedirect('/admin/2fa');
    }

    public function test_two_factor_middleware_allows_dashboard_after_session_marked_passed()
    {
        $admin = $this->createAdmin([
            'email' => 'secured2@example.com',
            'enable_2fa' => 'enabled',
        ]);

        $response = $this->actingAs($admin, 'admin')
            ->withSession([
                AdminAuth::SESSION_PASSED => true,
                AdminAuth::SESSION_USER_ID => $admin->id,
            ])
            ->get(route('admin.dashboard'));

        $response->assertStatus(200);
    }

    public function test_non_super_admin_cannot_access_manager_list()
    {
        $agent = $this->createAdmin([
            'email' => 'agent403@example.com',
            'type' => 'Conversion Agent',
        ]);

        $response = $this->actingAs($agent, 'admin')->get(route('madmin'));

        $response->assertStatus(403);
    }

    public function test_non_root_super_admin_cannot_toggle_other_admin_two_factor()
    {
        $root = $this->createAdmin([
            'email' => 'root@example.com',
            'type' => 'Super Admin',
        ]);

        config(['admin.root_id' => $root->id]);

        $otherSuper = $this->createAdmin([
            'email' => 'super2@example.com',
            'type' => 'Super Admin',
        ]);

        $target = $this->createAdmin([
            'email' => 'target@example.com',
            'type' => 'Conversion Agent',
            'enable_2fa' => 'disabled',
        ]);

        AdminAuth::markTwoFactorPassed($otherSuper);

        $response = $this->actingAs($otherSuper, 'admin')
            ->withSession([
                AdminAuth::SESSION_PASSED => true,
                AdminAuth::SESSION_USER_ID => $otherSuper->id,
            ])
            ->post(route('admin.2fa.toggle', $target), [
                'enable_2fa' => 'enabled',
            ]);

        $response->assertStatus(403);
        $this->assertSame('disabled', $target->fresh()->enable_2fa);
    }

    public function test_root_super_admin_can_toggle_other_admin_two_factor()
    {
        $root = $this->createAdmin([
            'email' => 'root2@example.com',
            'type' => 'Super Admin',
        ]);

        config(['admin.root_id' => $root->id]);

        $target = $this->createAdmin([
            'email' => 'target2@example.com',
            'type' => 'Conversion Agent',
            'enable_2fa' => 'disabled',
        ]);

        $response = $this->actingAs($root, 'admin')
            ->withSession([
                AdminAuth::SESSION_PASSED => true,
                AdminAuth::SESSION_USER_ID => $root->id,
            ])
            ->post(route('admin.2fa.toggle', $target), [
                'enable_2fa' => 'enabled',
            ]);

        $response->assertRedirect();
        $this->assertSame('enabled', $target->fresh()->enable_2fa);
    }
}
