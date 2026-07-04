<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{ $settings->site_name }} - Deposit Receipt</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{{ asset('public/css/dashboard.css') }}?v={{ @filemtime(public_path('css/dashboard.css')) }}">
    <script src="{{ asset('public/js/dashboard.js') }}?v={{ @filemtime(public_path('js/dashboard.js')) }}" defer></script>
    <style>
        @media print {
            body {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }
            .no-print {
                display: none !important;
            }
            .print-container {
                max-width: 100% !important;
                box-shadow: none !important;
                border: none !important;
            }
        }
    </style>
</head>
@php
    $status = $dp->status ?? 'Pending';
    $statusLower = strtolower((string) $status);
    $isPending = in_array($statusLower, ['pending', 'on-hold', 'on hold'], true);
    $isRejected = in_array($statusLower, ['rejected', 'failed', 'cancelled'], true);
    $isSuccess = in_array($statusLower, ['processed', 'completed', 'successful', 'success'], true);
    $txnDate = $dp->created_at ?? $dp->date ?? now();
    $amount = is_numeric($dp->amount) ? number_format((float) $dp->amount, 2, '.', ',') : $dp->amount;
@endphp
<body class="bg-gray-100">
    <div class="min-h-screen py-8 px-4 sm:px-6 lg:px-8">
        <div class="max-w-3xl mx-auto print-container">
            <div class="flex justify-end mb-4 gap-3 no-print">
                <button type="button" onclick="window.print()" class="inline-flex items-center px-4 py-2 bg-gray-800 text-white rounded-lg hover:bg-gray-700 transition-colors">
                    <i data-lucide="printer" class="w-4 h-4 mr-2"></i>
                    Print Receipt
                </button>
                <a href="{{ route('accounthistory') }}" class="inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">
                    <i data-lucide="arrow-left" class="w-4 h-4 mr-2"></i>
                    Transactions
                </a>
                <a href="{{ route('dashboard') }}" class="inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">
                    <i data-lucide="home" class="w-4 h-4 mr-2"></i>
                    Dashboard
                </a>
            </div>

            <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-100">
                <div class="relative bg-gradient-to-r from-primary-600 to-primary-700 px-6 py-8 text-white">
                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <img class="h-12 w-auto" src="{{ asset('storage/app/public/' . $settings->logo) }}" alt="{{ $settings->site_name }}">
                            <div class="ml-4">
                                <h1 class="text-xl font-bold">{{ $settings->site_name }}</h1>
                                <p class="text-sm text-white/80">Deposit Receipt</p>
                            </div>
                        </div>
                        <div class="flex flex-col items-end">
                            @if($isPending)
                                <div class="inline-flex items-center px-3 py-1 rounded-full bg-yellow-100 text-yellow-800">
                                    <i data-lucide="clock" class="h-4 w-4 mr-1"></i>
                                    <span class="text-sm font-medium text-yellow-800">{{ $status }}</span>
                                </div>
                            @elseif($isRejected)
                                <div class="inline-flex items-center px-3 py-1 rounded-full bg-red-400/90 text-white">
                                    <i data-lucide="x-circle" class="h-4 w-4 mr-1"></i>
                                    <span class="text-sm font-medium">{{ $status }}</span>
                                </div>
                            @elseif($isSuccess)
                                <div class="inline-flex items-center px-3 py-1 rounded-full bg-green-400 text-white">
                                    <i data-lucide="check-circle" class="h-4 w-4 mr-1"></i>
                                    <span class="text-sm font-medium">{{ $status }}</span>
                                </div>
                            @else
                                <div class="inline-flex items-center px-3 py-1 rounded-full bg-white/20 text-white">
                                    <i data-lucide="info" class="h-4 w-4 mr-1"></i>
                                    <span class="text-sm font-medium">{{ $status }}</span>
                                </div>
                            @endif
                            <p class="text-sm mt-1 text-white/80">Ref: {{ $dp->txn_id ?? $code ?? 'N/A' }}</p>
                        </div>
                    </div>
                </div>

                <div class="p-6 md:p-8">
                    <div class="mb-6">
                        <h2 class="text-lg font-bold text-gray-900 mb-2">Deposit Details</h2>
                        <p class="text-gray-600 text-sm mb-4">
                            @if($isPending)
                                Your deposit of {{ $settings->currency }}{{ $amount }} is pending confirmation.
                            @elseif($isRejected)
                                Your deposit of {{ $settings->currency }}{{ $amount }} was {{ strtolower($status) }}.
                            @elseif($isSuccess)
                                You have successfully deposited {{ $settings->currency }}{{ $amount }} into your account.
                            @else
                                Deposit of {{ $settings->currency }}{{ $amount }} — status: {{ $status }}.
                            @endif
                        </p>

                        <div class="bg-gray-50 rounded-lg p-4 border border-gray-100">
                            <div class="grid grid-cols-2 gap-4">
                                <div>
                                    <p class="text-sm text-gray-500 mb-1">Transaction Date</p>
                                    <div class="flex items-center">
                                        <i data-lucide="calendar" class="h-4 w-4 text-gray-400 mr-1"></i>
                                        <p class="text-sm font-medium text-gray-900">{{ \Carbon\Carbon::parse($txnDate)->format('M d, Y') }}</p>
                                    </div>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500 mb-1">Transaction Time</p>
                                    <div class="flex items-center">
                                        <i data-lucide="clock" class="h-4 w-4 text-gray-400 mr-1"></i>
                                        <p class="text-sm font-medium text-gray-900">{{ \Carbon\Carbon::parse($txnDate)->format('h:i A') }}</p>
                                    </div>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500 mb-1">Payment Method</p>
                                    <div class="flex items-center">
                                        <i data-lucide="credit-card" class="h-4 w-4 text-gray-400 mr-1"></i>
                                        <p class="text-sm font-medium text-gray-900">{{ $dp->payment_mode ?? 'N/A' }}</p>
                                    </div>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500 mb-1">Reference ID</p>
                                    <div class="flex items-center">
                                        <i data-lucide="hash" class="h-4 w-4 text-gray-400 mr-1"></i>
                                        <p class="text-sm font-medium text-gray-900">{{ $dp->txn_id ?? 'N/A' }}</p>
                                    </div>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500 mb-1">Type</p>
                                    <p class="text-sm font-medium text-gray-900">{{ $dp->type ?? 'Credit' }}</p>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-500 mb-1">Status</p>
                                    <p class="text-sm font-medium text-gray-900">{{ $status }}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-6">
                        <div class="flex items-center mb-2">
                            <i data-lucide="dollar-sign" class="h-5 w-5 text-primary-600 mr-2"></i>
                            <h2 class="text-lg font-bold text-gray-900">Financial Details</h2>
                        </div>
                        <div class="overflow-hidden bg-white rounded-lg border border-gray-200">
                            <div class="divide-y divide-gray-200">
                                <div class="grid grid-cols-2 gap-4 p-4">
                                    <div>
                                        <p class="text-sm text-gray-500">Amount</p>
                                        <p class="text-base font-medium text-gray-900">{{ $settings->currency }}{{ $amount }}</p>
                                    </div>
                                    <div>
                                        <p class="text-sm text-gray-500">Account</p>
                                        <p class="text-base font-medium text-gray-900">{{ Auth::user()->usernumber ?? Auth::user()->email }}</p>
                                    </div>
                                </div>
                                @if(!empty($dp->Description))
                                <div class="p-4 bg-gray-50">
                                    <p class="text-sm text-gray-500 mb-1">Description</p>
                                    <p class="text-sm font-medium text-gray-900">{{ $dp->Description }}</p>
                                </div>
                                @endif
                            </div>
                        </div>
                    </div>

                    @if(!empty($dp->proof))
                    <div class="mb-6">
                        <div class="flex items-center mb-2">
                            <i data-lucide="image" class="h-5 w-5 text-primary-600 mr-2"></i>
                            <h2 class="text-lg font-bold text-gray-900">Payment Proof</h2>
                        </div>
                        <div class="rounded-lg border border-gray-200 p-4">
                            <img
                                src="{{ asset('storage/app/public/' . $dp->proof) }}"
                                alt="Payment proof"
                                class="max-h-64 rounded-lg object-contain"
                                onerror="this.style.display='none'"
                            >
                        </div>
                    </div>
                    @endif

                    <div class="mt-8 text-center border-t border-gray-100 pt-6">
                        <div class="flex justify-center mb-2">
                            <i data-lucide="shield-check" class="h-5 w-5 text-gray-400"></i>
                        </div>
                        <p class="text-xs text-gray-500 mb-1">This receipt serves as confirmation of this deposit.</p>
                        <p class="text-xs text-gray-500">For any issues or inquiries, please contact support.</p>
                        <p class="text-xs text-gray-400 mt-1">© {{ date('Y') }} {{ $settings->site_name }}. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
