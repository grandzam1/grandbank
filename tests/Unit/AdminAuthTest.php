<?php

namespace Tests\Unit;

use App\Models\Admin;
use App\Support\AdminAuth;
use Tests\TestCase;

class AdminAuthTest extends TestCase
{
    public function test_normalize_two_factor_status()
    {
        $this->assertSame('enabled', AdminAuth::normalizeTwoFactorStatus('enabled'));
        $this->assertSame('disabled', AdminAuth::normalizeTwoFactorStatus('disabled'));
        $this->assertSame('disabled', AdminAuth::normalizeTwoFactorStatus('disbaled'));
        $this->assertSame('disabled', AdminAuth::normalizeTwoFactorStatus(null));
    }

    public function test_is_root_admin_uses_configured_root_id()
    {
        config(['admin.root_id' => 1]);

        $root = new Admin();
        $root->id = 1;
        $other = new Admin();
        $other->id = 2;

        $this->assertTrue(AdminAuth::isRootAdmin($root));
        $this->assertFalse(AdminAuth::isRootAdmin($other));
        $this->assertFalse(AdminAuth::isRootAdmin(null));
    }

    public function test_two_factor_session_is_scoped_to_admin_id()
    {
        $admin = new Admin();
        $admin->id = 5;

        AdminAuth::markTwoFactorPassed($admin);
        $this->assertTrue(AdminAuth::twoFactorPassed($admin));

        $other = new Admin();
        $other->id = 9;
        $this->assertFalse(AdminAuth::twoFactorPassed($other));

        AdminAuth::clearTwoFactorSession();
        $this->assertFalse(AdminAuth::twoFactorPassed($admin));
    }
}
