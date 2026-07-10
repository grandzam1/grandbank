<?php
if (Auth('admin')->User()->dashboard_style == 'light') {
    $text = 'dark';
} else {
    $text = 'light';
}
?>
@extends('layouts.app')
@section('content')
    @include('admin.topmenu')
    @include('admin.sidebar')
    <div class="main-panel ">
        <div class="content ">
            <div class="page-inner">
                <div class="mt-2 mb-4">
                    <h1 class="title1 ">Managers List</h1>
                </div>
                <x-danger-alert />
                <x-success-alert />

                @if (\App\Support\AdminAuth::isRootAdmin(Auth('admin')->user()))
                    <div class="alert alert-info">
                        As Root Super Admin, you can manage two-factor authentication for all other staff accounts
                        below. Recovery actions help when an admin is locked out or cannot receive their email OTP.
                    </div>
                @endif

                @if (Auth('admin')->User()->type === 'Super Admin')
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <h5 class="card-title mb-2">Staff customer login</h5>
                            <p class="text-muted small mb-3">
                                Super Admins can always log in as customers from Manage Users.
                                Use this switch to allow or block non–Super Admin staff from doing the same.
                                Individual staff still need the <strong>Customer login</strong> permission below.
                            </p>
                            <form method="post" action="{{ route('admin.settings.staff-impersonation') }}" class="form-inline">
                                @csrf
                                <select name="allow_staff_user_impersonation" class="form-control mr-2" required>
                                    <option value="1" @if ($settings && $settings->allow_staff_user_impersonation) selected @endif>
                                        Allow staff customer login
                                    </option>
                                    <option value="0" @if (!$settings || !$settings->allow_staff_user_impersonation) selected @endif>
                                        Block staff customer login
                                    </option>
                                </select>
                                <button type="submit" class="btn btn-primary btn-sm">Save policy</button>
                            </form>
                        </div>
                    </div>
                @endif

                <div class="mb-5 row">
                    <div class="col p-4 shadow card ">
                        <div class="table-responsive" data-example-id="hoverable-table">
                            <table id="ShipTable" class="table table-hover ">
                                <thead>
                                    <tr>
                                        <th>USER ID</th>
                                        <th>FIRSTNAME</th>
                                        <th>LASTNAME</th>
                                        <th>EMAIL</th>
                                        <th>PHONE</th>
                                        <th>TYPE</th>
                                        <th>STATUS</th>
                                        <th>2FA</th>
                                        <th>CUSTOMER LOGIN</th>
                                        <th>ACTION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($admins as $admin)
                                        <tr>
                                            <td>{{ $admin->id }}</td>
                                            <td>{{ $admin->firstName }}</td>
                                            <td>{{ $admin->lastName }}</td>
                                            <td>{{ $admin->email }}</td>
                                            <td>{{ $admin->phone }}</td>
                                            <td>{{ $admin->type }}</td>
                                            <td>{{ $admin->acnt_type_active }}</td>
                                            <td>
                                                @if ($admin->enable_2fa === 'enabled')
                                                    <span class="badge badge-success">Enabled</span>
                                                @else
                                                    <span class="badge badge-secondary">Disabled</span>
                                                @endif
                                            </td>
                                            <td>
                                                @if ($admin->type === 'Super Admin')
                                                    <span class="badge badge-primary">Always allowed</span>
                                                @elseif ($admin->can_impersonate_users && $settings && $settings->allow_staff_user_impersonation)
                                                    <span class="badge badge-success">Allowed</span>
                                                @elseif ($admin->can_impersonate_users)
                                                    <span class="badge badge-warning">Granted (policy off)</span>
                                                @else
                                                    <span class="badge badge-secondary">Not allowed</span>
                                                @endif
                                            </td>
                                            <td>
                                                <div class="dropdown">
                                                    <a class="btn btn-secondary btn-sm dropdown-toggle" href="#"
                                                        role="button" id="dropdownMenuLink" data-toggle="dropdown"
                                                        aria-haspopup="true" aria-expanded="false">
                                                        Actions
                                                    </a>
                                                    <div class="dropdown-menu " aria-labelledby="dropdownMenuLink">

                                                        @if ($admin->acnt_type_active == null || $admin->acnt_type_active == 'blocked')
                                                            <a class="m-1 btn btn-primary btn-sm"
                                                                href="{{ url('admin/dashboard/unblock') }}/{{ $admin->id }}">Unblock</a>
                                                        @else
                                                            <a class="m-1 btn btn-danger btn-sm"
                                                                href="{{ url('admin/dashboard/ublock') }}/{{ $admin->id }}">Block</a>
                                                        @endif
                                                        <a href="#" data-toggle="modal"
                                                            data-target="#resetpswdModal{{ $admin->id }}"
                                                            class="m-1 btn btn-warning btn-sm">Reset Password</a>

                                                        <a href="#" data-toggle="modal"
                                                            data-target="#deleteModal{{ $admin->id }}"
                                                            class="m-1 btn btn-danger btn-sm">Delete</a>
                                                        <a href="#" data-toggle="modal"
                                                            data-target="#edituser{{ $admin->id }}"
                                                            class="m-1 btn btn-secondary btn-sm">Edit</a>
                                                        <a href="#" data-toggle="modal"
                                                            data-target="#sendmailModal{{ $admin->id }}"
                                                            class="m-1 btn btn-info btn-sm">Send Email</a>
                                                        @if (\App\Support\AdminAuth::isRootAdmin(Auth('admin')->user()) && !\App\Support\AdminAuth::isRootAdmin($admin))
                                                            <a href="#" data-toggle="modal"
                                                                data-target="#twofaModal{{ $admin->id }}"
                                                                class="m-1 btn btn-dark btn-sm">Manage 2FA</a>
                                                        @endif
                                                        @if (Auth('admin')->User()->type === 'Super Admin' && $admin->type !== 'Super Admin')
                                                            <a href="#" data-toggle="modal"
                                                                data-target="#impersonationModal{{ $admin->id }}"
                                                                class="m-1 btn btn-success btn-sm">Customer login</a>
                                                        @endif
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>


                                        <!-- Reset user password Modal -->
                                        <div id="resetpswdModal{{ $admin->id }}" class="modal fade" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header  ">

                                                        <h4 class="modal-title ">Reset Password</strong></h4>
                                                        <button type="button" class="close "
                                                            data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <div class="modal-body  p-3">
                                                        <p class="">Are you sure you want to reset the password for
                                                            <strong>{{ $admin->firstName }} {{ $admin->lastName }}</strong>?</p>
                                                        <p class="small text-muted mb-3">
                                                            A new random temporary password will be generated for this
                                                            account only and emailed to <strong>{{ $admin->email }}</strong>.
                                                            Other staff accounts are not affected. They can change their
                                                            own password later from Account Profile.
                                                        </p>
                                                        <a class="btn btn-danger"
                                                            href="{{ url('admin/dashboard/resetadpwd') }}/{{ $admin->id }}">Reset
                                                            Now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Reset user password Modal -->

                                        <!-- Delete user Modal -->
                                        <div id="deleteModal{{ $admin->id }}" class="modal fade" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header ">

                                                        <h4 class="modal-title ">Delete Manager</strong></h4>
                                                        <button type="button" class="close "
                                                            data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <div class="modal-body  p-3">
                                                        <p class="">Are you sure you want to delete
                                                            {{ $admin->firstName }}</p>
                                                        <a class="btn btn-danger"
                                                            href="{{ url('admin/dashboard/deleletadmin') }}/{{ $admin->id }}">Yes
                                                            i'm sure</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Delete user Modal -->

                                        <!-- Edit user Modal -->
                                        <div id="edituser{{ $admin->id }}" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header ">

                                                        <h4 class="modal-title ">Edit user details.</strong></h4>
                                                        <button type="button" class="close "
                                                            data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <div class="modal-body ">
                                                        <form style="padding:3px;" role="form" method="post"
                                                            action="{{ route('editadmin') }}">
                                                            <h5 class=" ">Firstname</h5>
                                                            <input style="padding:5px;" class="form-control  "
                                                                value="{{ $admin->firstName }}" type="text"
                                                                name="fname" required><br />
                                                            <h5 class=" ">Lastname</h5>
                                                            <input style="padding:5px;" class="form-control  "
                                                                value="{{ $admin->lastName }}" type="text"
                                                                name="l_name" required><br />
                                                            <h5 class=" ">Email</h5>
                                                            <input style="padding:5px;" class="form-control  "
                                                                value="{{ $admin->email }}" type="email"
                                                                name="email" required><br />
                                                            <h5 class=" ">Phone Number</h5>
                                                            <input style="padding:5px;" class="form-control  "
                                                                value="{{ $admin->phone }}" type="text"
                                                                name="phone" required>
                                                            <br>
                                                            <h5 class=" ">Type</h5>
                                                            <select class="form-control  " name="type">
                                                                <option>{{ $admin->type }}</option>
                                                                <option>Super Admin</option>
                                                                <option>Admin</option>
                                                                <option>Conversion Agent</option>
                                                            </select><br>
                                                            <input type="hidden" name="_token"
                                                                value="{{ csrf_token() }}">
                                                            <input type="hidden" name="user_id"
                                                                value="{{ $admin->id }}">
                                                            <input type="submit" class="btn btn-info"
                                                                value="Update account">
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Edit user Modal -->
                                        <!-- send a single user email Modal-->
                                        <div id="sendmailModal{{ $admin->id }}" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header ">
                                                        <h4 class="modal-title ">Send Email Message</h4>
                                                        <button type="button" class="close "
                                                            data-dismiss="modal">&times;</button>
                                                    </div>

                                                    <div class="modal-body ">
                                                        <p class="">This message will be sent to
                                                            {{ $admin->firstName }} {{ $admin->lastName }} </p>
                                                        <form role="form" method="post"
                                                            action="{{ route('sendmailtoadmin') }}">
                                                            <input type="hidden" name="user_id"
                                                                value="{{ $admin->id }}">
                                                            <div class="form-group">
                                                                <input type="text" name="subject"
                                                                    class="form-control  "
                                                                    placeholder="Enter Email Subject">
                                                            </div>
                                                            <div class="form-group">
                                                                <textarea class="form-control  " name="message " row="3" placeholder="Type your message here" required></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="hidden" name="_token"
                                                                    value="{{ csrf_token() }}">
                                                                <input type="submit" class="btn btn-primary"
                                                                    value="Send">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /send a single user email Modal-->

                                        @if (\App\Support\AdminAuth::isRootAdmin(Auth('admin')->user()) && !\App\Support\AdminAuth::isRootAdmin($admin))
                                            <!-- Manage 2FA Modal -->
                                            <div id="twofaModal{{ $admin->id }}" class="modal fade" role="dialog">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Manage 2FA —
                                                                {{ $admin->firstName }} {{ $admin->lastName }}</h4>
                                                            <button type="button" class="close"
                                                                data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <div class="modal-body p-3">
                                                            <p class="mb-2">
                                                                <strong>Email:</strong> {{ $admin->email }}<br>
                                                                <strong>Role:</strong> {{ $admin->type }}<br>
                                                                <strong>Current 2FA:</strong>
                                                                @if ($admin->enable_2fa === 'enabled')
                                                                    <span class="text-success">Enabled</span>
                                                                @else
                                                                    <span class="text-muted">Disabled</span>
                                                                @endif
                                                            </p>
                                                            <hr>
                                                            <h5 class="mb-3">Change 2FA setting</h5>
                                                            <form method="post"
                                                                action="{{ route('admin.2fa.toggle', $admin) }}"
                                                                class="mb-4">
                                                                @csrf
                                                                <div class="form-group">
                                                                    <select name="enable_2fa" class="form-control"
                                                                        required>
                                                                        <option value="disabled"
                                                                            @if ($admin->enable_2fa !== 'enabled') selected @endif>
                                                                            Disable 2FA</option>
                                                                        <option value="enabled"
                                                                            @if ($admin->enable_2fa === 'enabled') selected @endif>
                                                                            Enable 2FA</option>
                                                                    </select>
                                                                </div>
                                                                <button type="submit" class="btn btn-primary btn-sm">Save
                                                                    2FA Setting</button>
                                                            </form>
                                                            <h5 class="mb-3">Recovery actions</h5>
                                                            <p class="small text-muted">Use these if the admin is stuck
                                                                on the OTP screen or did not receive their code. OTP
                                                                codes are never shown here.</p>
                                                            <form method="post"
                                                                action="{{ route('admin.2fa.reset', $admin) }}"
                                                                class="d-inline">
                                                                @csrf
                                                                <button type="submit" class="btn btn-warning btn-sm"
                                                                    onclick="return confirm('Reset 2FA lock for {{ $admin->firstName }}?')">
                                                                    Reset 2FA Lock
                                                                </button>
                                                            </form>
                                                            @if ($admin->enable_2fa === 'enabled')
                                                                <form method="post"
                                                                    action="{{ route('admin.2fa.resend', $admin) }}"
                                                                    class="d-inline ml-1">
                                                                    @csrf
                                                                    <button type="submit" class="btn btn-info btn-sm"
                                                                        onclick="return confirm('Send a new OTP email to {{ $admin->email }}?')">
                                                                        Resend OTP Email
                                                                    </button>
                                                                </form>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /Manage 2FA Modal -->
                                        @endif

                                        @if (Auth('admin')->User()->type === 'Super Admin' && $admin->type !== 'Super Admin')
                                            <div id="impersonationModal{{ $admin->id }}" class="modal fade" role="dialog">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Customer login —
                                                                {{ $admin->firstName }} {{ $admin->lastName }}</h4>
                                                            <button type="button" class="close"
                                                                data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <div class="modal-body p-3">
                                                            <p class="small text-muted mb-3">
                                                                Allow this staff member to log in as customers from
                                                                Manage Users. The global staff policy must also be enabled.
                                                            </p>
                                                            <form method="post"
                                                                action="{{ route('admin.staff.impersonation', $admin) }}">
                                                                @csrf
                                                                <div class="form-group">
                                                                    <select name="can_impersonate_users" class="form-control"
                                                                        required>
                                                                        <option value="1"
                                                                            @if ($admin->can_impersonate_users) selected @endif>
                                                                            Grant customer login</option>
                                                                        <option value="0"
                                                                            @if (!$admin->can_impersonate_users) selected @endif>
                                                                            Revoke customer login</option>
                                                                    </select>
                                                                </div>
                                                                <button type="submit" class="btn btn-primary btn-sm">Save
                                                                    permission</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endif
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endsection
