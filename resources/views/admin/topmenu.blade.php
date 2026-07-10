<?php
if (Auth('admin')->User()->dashboard_style == 'light') {
    $bgmenu = 'blue';
    $bg = 'light';
    $text = 'dark';
} else {
    $bgmenu = 'dark';
    $bg = 'dark';
    $text = 'light';
}

$adminUser = Auth('admin')->user();
?>
<div class="main-header">
    <!-- Logo Header -->
    <div class="logo-header" data-background-color="{{ $bgmenu }}">
        <a href="{{ url('/admin/dashboard') }}" class="logo admin-brand-logo">
            {{ $settings->site_name ?? 'GrandBank' }}
        </a>

        <button class="ml-auto navbar-toggler sidenav-toggler" type="button" data-toggle="collapse" data-target="collapse"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
                <i class="icon-menu"></i>
            </span>
        </button>
        <button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
        <div class="nav-toggle">
            <button class="btn btn-toggle toggle-sidebar">
                <i class="icon-menu"></i>
            </button>
        </div>
    </div>
    <!-- End Logo Header -->

    <!-- Navbar Header -->
    <nav class="navbar navbar-header navbar-expand-lg admin-top-navbar" data-background-color="{{ $bgmenu }}">
        <div class="container-fluid admin-top-navbar__inner">
            <div class="collapse" id="search-nav">
                <a href="{{ route('manageusers') }}">
                    <form class="navbar-left navbar-form nav-search mr-md-3" action="javascript:void(0)">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="submit" class="pr-1 btn btn-search">
                                    <i class="fa fa-search search-icon"></i>
                                </button>
                            </div>
                            <input type="text" placeholder="Manage users"
                                class="form-control text-{{ $text }}">
                        </div>
                    </form>
                </a>
            </div>

            <div class="admin-profile-slot">
                <div class="nav-item dropdown admin-profile-menu">
                    <a class="nav-link admin-profile-trigger" href="#" id="adminProfileDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                        aria-label="Admin account menu">
                        <i class="fas fa-user-circle"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right admin-profile-dropdown animated fadeIn"
                        aria-labelledby="adminProfileDropdown">
                        <div class="admin-profile-dropdown__header">
                            <div class="admin-profile-dropdown__name">
                                {{ $adminUser->firstName }} {{ $adminUser->lastName }}
                            </div>
                            <div class="admin-profile-dropdown__role">{{ $adminUser->type ?? 'Admin' }}</div>
                        </div>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item admin-profile-dropdown__item" href="{{ url('admin/dashboard/adminprofile') }}">
                            <i class="fas fa-user-cog"></i>
                            <span>Account Settings</span>
                        </a>
                        <a class="dropdown-item admin-profile-dropdown__item"
                            href="{{ url('admin/dashboard/adminchangepassword') }}">
                            <i class="fas fa-key"></i>
                            <span>Change Password</span>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item admin-profile-dropdown__item admin-profile-dropdown__item--logout"
                            href="javascript:void(0)" data-toggle="modal" data-target="#adminLogoutModal">
                            <i class="fas fa-sign-out-alt"></i>
                            <span>Logout</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
</div>

<div id="adminLogoutModal" class="modal fade admin-logout-modal" tabindex="-1" role="dialog"
    aria-labelledby="adminLogoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title" id="adminLogoutModalLabel">Confirm logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body pt-2">
                <p class="mb-0 text-muted">
                    Are you sure you want to log out of the admin dashboard?
                </p>
            </div>
            <div class="modal-footer border-0 pt-0">
                <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="adminLogoutConfirmBtn">
                    <i class="fas fa-sign-out-alt mr-1"></i> Logout
                </button>
            </div>
        </div>
    </div>
</div>

<form id="admin-logout-form" action="{{ route('adminlogout') }}" method="POST" class="d-none">
    @csrf
</form>

<script>
    document.getElementById('adminLogoutConfirmBtn').addEventListener('click', function() {
        document.getElementById('admin-logout-form').submit();
    });
</script>
