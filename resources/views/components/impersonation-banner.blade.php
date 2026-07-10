@if (\App\Support\UserImpersonation::impersonatorAdminId())
    <div class="bg-amber-50 border-b border-amber-200 px-4 py-3" role="alert">
        <div class="max-w-7xl mx-auto flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2 text-sm text-amber-900">
            <p>
                <span class="font-semibold">Admin preview:</span>
                You are viewing this customer account. Log out to return to the admin dashboard.
            </p>
            <a href="{{ route('admin.users.end-impersonation') }}"
                class="inline-flex items-center justify-center rounded-lg bg-amber-500 px-4 py-2 text-xs font-semibold text-white hover:bg-amber-600 transition">
                Return to admin
            </a>
        </div>
    </div>
@endif
