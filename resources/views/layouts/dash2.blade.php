<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $settings->site_name }} | @yield('title')</title>
    <meta name="description" content="Swift and Secure Money Transfer to any UK bank account will become a breeze with {{$settings->site_name}}." />
    <link rel="shortcut icon" href="{{ asset('storage/' . $settings->favicon) }}" />

    <!-- Apply saved dark mode before paint to avoid flash -->
    <script>
        (function () {
            try {
                if (localStorage.getItem('grandbank_theme') === 'dark') {
                    document.documentElement.classList.add('dark');
                }
            } catch (e) {}
        })();
    </script>
    
    <!-- Initial theme colors setup (before anything else loads) -->
    <script>
        // Set CSS theme variables - these match our Tailwind theme
        document.documentElement.style.setProperty('--primary-color', '{{ isset($appearanceSettings) ? $appearanceSettings->primary_color : "#0ea5e9" }}');
        document.documentElement.style.setProperty('--primary-color-dark', '{{ isset($appearanceSettings) ? $appearanceSettings->primary_color_dark : "#0369a1" }}');
        document.documentElement.style.setProperty('--primary-color-light', '{{ isset($appearanceSettings) ? $appearanceSettings->primary_color_light : "#38bdf8" }}');
        document.documentElement.style.setProperty('--primary-color-lightest', '{{ isset($appearanceSettings) ? $appearanceSettings->primary_color_light : "#bae6fd" }}');
        document.documentElement.style.setProperty('--secondary-color', '{{ isset($appearanceSettings) ? $appearanceSettings->secondary_color : "#14b8a6" }}');
        document.documentElement.style.setProperty('--secondary-color-dark', '{{ isset($appearanceSettings) ? $appearanceSettings->secondary_color_dark : "#0f766e" }}');
        document.documentElement.style.setProperty('--secondary-color-light', '{{ isset($appearanceSettings) ? $appearanceSettings->secondary_color_light : "#2dd4bf" }}');
        document.documentElement.style.setProperty('--accent-color', '#ec4899');
        document.documentElement.style.setProperty('--text-color', '{{ isset($appearanceSettings) ? $appearanceSettings->text_color : "#111827" }}');
        document.documentElement.style.setProperty('--bg-color', '{{ isset($appearanceSettings) ? $appearanceSettings->bg_color : "#f9fafb" }}');
        document.documentElement.style.setProperty('--sidebar-bg-color', '{{ isset($appearanceSettings) ? $appearanceSettings->sidebar_bg_color : "#1e293b" }}');
        document.documentElement.style.setProperty('--sidebar-text-color', '{{ isset($appearanceSettings) ? $appearanceSettings->sidebar_text_color : "#ffffff" }}');
        document.documentElement.style.setProperty('--card-bg-color', '{{ isset($appearanceSettings) ? $appearanceSettings->card_bg_color : "#ffffff" }}');
    </script>
    
    <!-- Local dashboard assets (Mix: Tailwind + Alpine + Lucide + dark mode) -->
    <link rel="stylesheet" href="{{ asset('css/dashboard.css') }}?v={{ @filemtime(public_path('css/dashboard.css')) }}">
    <link rel="stylesheet" href="{{ asset('css/customer-branding.css') }}?v={{ @filemtime(public_path('css/customer-branding.css')) }}">
    <script src="{{ asset('js/dashboard.js') }}?v={{ @filemtime(public_path('js/dashboard.js')) }}" defer></script>
    
    @if(isset($appearanceSettings) && $appearanceSettings->custom_css)
    <style>
        {!! $appearanceSettings->custom_css !!}
    </style>
    @endif
    
    @if(isset($appearanceSettings) && $appearanceSettings->disable_animations)
    <style>
        * {
            animation: none !important;
            transition: none !important;
        }
    </style>
    @endif

    @laravelPWA
</head>

<body class="bg-gray-50">
    <!-- Modern Page Loader -->
    <div class="page-loading active">
        <div class="page-loading-inner">
            <div class="loading-container">
                <div class="loading-animation">
                    <div class="circle"></div>
                    <div class="circle"></div>
                    <div class="circle"></div>
                    <div class="circle"></div>
                    <div class="core"></div>
                </div>
                <div class="text">{{ $settings->site_name }} Banking</div>
            </div>
        </div>
    </div>
    
    <!-- Main Layout -->
    <div class="flex h-screen overflow-hidden" x-data="{sidebarOpen: false, mobileMenuOpen: false, userDropdownOpen: false, notificationsOpen: false}">
        <!-- Sidebar - Desktop -->
        <div class="hidden md:flex md:w-64 md:flex-col bg-white h-full border-r border-gray-200 shadow-sm">
            <div class="flex flex-col flex-grow pt-5 pb-4 overflow-y-auto">
                <!-- Logo -->
                <div class="flex items-center justify-center flex-shrink-0 px-4 mb-6">
                    <a href="/" class="flex items-center">
                        <img src="{{ asset('storage/'.$settings->logo)}}" alt="Logo" class="customer-logo customer-logo--sidebar">
                    </a>
                </div>
                
                <!-- User Info Card - Desktop Sidebar -->
                <div class="px-4 mb-6">
                    <div class="bg-gray-50 rounded-xl p-4 shadow-sm border border-gray-100">
                        <div class="flex items-center mb-3">
    <div class="flex-shrink-0 mr-3">
        @if(!empty(Auth::user()->profile_photo_path))
            <img src="{{ Auth::user()->profile_photo_url }}" 
                alt="{{ Auth::user()->name }}" 
                class="h-10 w-10 rounded-full object-cover border-2 border-primary-100"
                onerror="this.src='https://ui-avatars.com/api/?name={{ urlencode(Auth::user()->name) }}&background=random'">
        @else
            @php
                $initials = strtoupper(substr(Auth::user()->name, 0, 1) . substr(Auth::user()->lastname, 0, 1));
            @endphp
            <div class="h-10 w-10 rounded-full bg-primary-100 flex items-center justify-center text-white font-bold border-2 border-primary-100">
                {{ $initials }}
            </div>
        @endif
    </div>
    <div class="flex-1 min-w-0">
        <p class="text-sm font-medium text-gray-900 truncate">
            {{ Auth::user()->name }} {{ Auth::user()->lastname }}
        </p>
        <p class="text-xs text-gray-500 truncate">
            ID: {{ Auth::user()->usernumber }}
        </p>
    </div>
</div>

                        
                        <!-- KYC Verification Status -->
                        <div class="mb-3">
                            @if(Auth::user()->account_verify == 'Verified')
                                <div class="flex items-center justify-center py-1 rounded-md bg-green-50 border border-green-100">
                                    <span class="text-xs text-green-800 font-medium flex items-center">
                                        <i data-lucide="check-circle" class="h-3 w-3 mr-1"></i> KYC Verified
                                    </span>
                                </div>
                            @elseif(Auth::user()->account_verify == 'Under Review')
                                <div class="flex items-center justify-center py-1 rounded-md bg-yellow-50 border border-yellow-100">
                                    <span class="text-xs text-yellow-800 font-medium flex items-center">
                                        <i data-lucide="clock" class="h-3 w-3 mr-1"></i> KYC Under Review
                                    </span>
                                </div>
                            @else
                                <a href="{{ route('account.verify') }}" class="flex items-center justify-center py-1 rounded-md bg-red-50 border border-red-100 hover:bg-red-100 transition-colors">
                                    <span class="text-xs text-red-800 font-medium flex items-center">
                                        <i data-lucide="alert-circle" class="h-3 w-3 mr-1"></i> Verify KYC
                                    </span>
                                </a>
                            @endif
                        </div>
                        
                        <div class="flex space-x-2">
                            <a href="{{ route('profile') }}" class="flex-1 inline-flex justify-center items-center px-2.5 py-1.5 border border-gray-300 shadow-sm text-xs font-medium rounded text-gray-700 bg-white hover:bg-gray-50">
                                <i data-lucide="user" class="h-3 w-3 mr-1"></i> Profile
                            </a>
                            <a href="{{ route('logout') }}" 
                                onclick="event.preventDefault(); document.getElementById('logout-form-sidebar').submit();"
                                class="flex-1 inline-flex justify-center items-center px-2.5 py-1.5 border border-transparent shadow-sm text-xs font-medium rounded text-white bg-primary-600 hover:bg-primary-700">
                                <i data-lucide="log-out" class="h-3 w-3 mr-1"></i> Logout
                            </a>
                            <form id="logout-form-sidebar" action="{{ route('logout') }}" method="POST" style="display: none;">
                                {{ csrf_field() }}
                            </form>
                        </div>
                    </div>
                </div>
                
                <!-- Menu Items -->
                <nav class="flex-1 px-4 space-y-1">
                    <p class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mt-6 mb-2">Main Menu</p>
                    
                    <a href="{{ route('dashboard') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('dashboard') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="home" class="mr-3 h-5 w-5 {{ request()->routeIs('dashboard') ? 'text-black' : 'text-gray-500' }}"></i>
                        Dashboard
                    </a>
                    
                    <a href="{{ route('accounthistory') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('accounthistory') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="activity" class="mr-3 h-5 w-5 {{ request()->routeIs('accounthistory') ? 'text-black' : 'text-gray-500' }}"></i>
                        Transactions
                    </a>
                    
                    <!-- Cards Menu Item -->
                    <a href="{{ route('cards') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('cards*') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="credit-card" class="mr-3 h-5 w-5 {{ request()->routeIs('cards*') ? 'text-black' : 'text-gray-500' }}"></i>
                        Cards
                    </a>
                    
                    <p class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mt-6 mb-2">Transfers</p>
                    
                    <a href="{{ route('localtransfer') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('localtransfer') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="send" class="mr-3 h-5 w-5 {{ request()->routeIs('localtransfer') ? 'text-black' : 'text-gray-500' }}"></i>
                        Local Transfer
                    </a>
                    
                    <a href="{{ route('internationaltransfer') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('internationaltransfer') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="globe" class="mr-3 h-5 w-5 {{ request()->routeIs('internationaltransfer') ? 'text-black' : 'text-gray-500' }}"></i>
                        International Wire
                    </a>
                    
                    <a href="{{ route('deposits') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('deposits') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="download" class="mr-3 h-5 w-5 {{ request()->routeIs('deposits') ? 'text-black' : 'text-gray-500' }}"></i>
                        Deposit
                    </a>
                    
                    <p class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mt-6 mb-2">Services</p>
                    
                    <a href="{{ route('loan') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('loan') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="credit-card" class="mr-3 h-5 w-5 {{ request()->routeIs('loan') ? 'text-black' : 'text-gray-500' }}"></i>
                        Loan Request
                    </a>
                    
                    <a href="{{ route('irs-refund') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('irs-refund*') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="receipt" class="mr-3 h-5 w-5 {{ request()->routeIs('irs-refund*') ? 'text-black' : 'text-gray-500' }}"></i>
                        IRS Tax Refund
                    </a>
                    
                    <a href="{{ route('veiwloan') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('veiwloan') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="history" class="mr-3 h-5 w-5 {{ request()->routeIs('veiwloan') ? 'text-black' : 'text-gray-500' }}"></i>
                        Loan History
                    </a>
                    
                    <p class="px-3 text-xs font-semibold text-gray-500 uppercase tracking-wider mt-6 mb-2">Account</p>
                    
                    <a href="{{ route('profile') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('profile') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="settings" class="mr-3 h-5 w-5 {{ request()->routeIs('profile') ? 'text-black' : 'text-gray-500' }}"></i>
                        Settings
                    </a>
                    
                    <a href="{{ route('support') }}" class="flex items-center px-3 py-2.5 text-sm font-medium rounded-lg {{ request()->routeIs('support') ? 'bg-primary-50 text-black border-l-4 border-primary-500 pl-2' : 'text-gray-700 hover:bg-gray-50' }}">
                        <i data-lucide="help-circle" class="mr-3 h-5 w-5 {{ request()->routeIs('support') ? 'text-black' : 'text-gray-500' }}"></i>
                        Support Ticket
                    </a>
                </nav>
            </div>
            
            <!-- App Version -->
            <div class="p-4 border-t border-gray-200">
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <i data-lucide="shield-check" class="h-4 w-4 text-green-500 mr-2"></i>
                        <span class="text-xs text-gray-500">Secure Banking</span>
                    </div>
                    <span class="text-xs text-gray-400">v1.2.0</span>
                </div>
            </div>
        </div>
        
        <!-- Main Content Area -->
        <div class="flex flex-col flex-1 overflow-hidden">
            <!-- Top Header -->
            <header class="bg-white shadow-sm z-20">
                <div class="flex items-center justify-between px-4 py-3">
                    <!-- Mobile: Logo + Menu button -->
                    <div class="flex items-center md:hidden">
                        <button 
                            @click="sidebarOpen = false; mobileMenuOpen = !mobileMenuOpen" 
                            type="button" 
                            class="text-gray-500 hover:text-gray-600 focus:outline-none"
                            aria-label="Toggle menu">
                            <i data-lucide="menu" class="h-6 w-6"></i>
                        </button>
                        <a href="/" class="ml-4">
                            <img src="{{ asset('storage/'.$settings->logo)}}" alt="Logo" class="customer-logo customer-logo--mobile">
                        </a>
                    </div>
                    
                    <!-- Desktop: Current Date & Time + Search bar -->
                    <div class="hidden md:flex md:flex-1 md:items-center">
                        <div class="text-sm text-gray-600 flex items-center">
                            <i data-lucide="calendar" class="h-4 w-4 mr-2 text-gray-400"></i>
                            <span>{{ now()->format('l, F j, Y') }}</span>
                        </div>
                    </div>
                    
                    <!-- Right Nav Items (Both mobile & desktop) -->
                    <div class="flex items-center space-x-4">
                        <!-- Balance indicator (desktop only) -->
                        <div class="hidden md:flex items-center px-3 py-1.5 bg-primary-50 rounded-full">
                            <i data-lucide="wallet" class="h-4 w-4 text-gray-900 mr-2"></i>
                            <span class="text-sm font-medium text-gray-900">
                                {{ $settings->currency }}{{ number_format(Auth::user()->account_bal,0, '.', ',') }}
                            </span>
                        </div>
                        
                        <!-- Notification Bell -->
                        <div class="relative" x-data="{ notificationsOpen: false }">
                            <button 
                                @click="notificationsOpen = !notificationsOpen; userDropdownOpen = false" 
                                class="relative p-1 text-gray-500 hover:text-gray-600 focus:outline-none">
                                <i data-lucide="bell" class="h-6 w-6"></i>
                                @if(Auth::user()->unreadNotificationsCount() > 0)
                                <span class="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full"></span>
                                @endif
                            </button>
                            
                            <!-- Notification dropdown -->
                            <div 
                                x-show="notificationsOpen" 
                                @click.away="notificationsOpen = false" 
                                class="origin-top-right absolute right-0 mt-2 w-80 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none z-50" 
                                x-transition:enter="transition ease-out duration-100"
                                x-transition:enter-start="transform opacity-0 scale-95"
                                x-transition:enter-end="transform opacity-100 scale-100"
                                x-transition:leave="transition ease-in duration-75"
                                x-transition:leave-start="transform opacity-100 scale-100"
                                x-transition:leave-end="transform opacity-0 scale-95">
                                <div class="px-4 py-3 border-b border-gray-100">
                                    <div class="flex items-center justify-between">
                                        <h3 class="text-sm font-semibold text-gray-900">Notifications</h3>
                                        <form action="{{ route('notifications.read.all') }}" method="POST">
                                            @csrf
                                            <button type="submit" class="text-xs text-black hover:text-primary-500">Mark all as read</button>
                                        </form>
                                    </div>
                                </div>
                                
                                <!-- Notification items -->
                                <div class="max-h-60 overflow-y-auto">
                                    @php
                                        $notifications = Auth::user()->notifications()->latest()->take(5)->get();
                                    @endphp
                                    
                                    @forelse($notifications as $notification)
                                        <a 
                                            href="{{ route('notifications.read', $notification->id) }}" 
                                            class="block px-4 py-3 hover:bg-gray-50 transition {{ $notification->is_read ? 'opacity-60' : '' }}"
                                        >
                                            <div class="flex">
                                                <div class="flex-shrink-0">
                                                    <div class="flex items-center justify-center h-9 w-9 rounded-full 
                                                        @if($notification->type == 'success') bg-green-100 text-green-500 
                                                        @elseif($notification->type == 'warning') bg-yellow-100 text-yellow-500 
                                                        @elseif($notification->type == 'danger') bg-red-100 text-red-500 
                                                        @else bg-blue-100 text-blue-500 @endif"
                                                    >
                                                        <i data-lucide="{{ $notification->icon ?? 'bell' }}" class="h-5 w-5"></i>
                                                    </div>
                                                </div>
                                                <div class="ml-3 flex-1">
                                                    @if($notification->title)
                                                        <p class="text-sm font-medium text-gray-900">{{ $notification->title }}</p>
                                                    @endif
                                                    <p class="text-sm text-gray-600 line-clamp-2">{{ $notification->message }}</p>
                                                    <p class="text-xs text-gray-500 mt-1">{{ $notification->created_at->diffForHumans() }}</p>
                                                </div>
                                            </div>
                                        </a>
                                    @empty
                                        <div class="py-6 text-center">
                                            <i data-lucide="inbox" class="h-8 w-8 mx-auto text-gray-300 mb-1"></i>
                                            <p class="text-sm text-gray-500">No notifications yet</p>
                                        </div>
                                    @endforelse
                                </div>
                                
                                <div class="px-4 py-3 border-t border-gray-100 text-center">
                                    <a href="{{ route('notifications') }}" class="text-sm font-medium text-black hover:text-primary-500">View all notifications</a>
                                </div>
                            </div>
                        </div>
                        
                        <!-- User Profile Dropdown -->
                        <div class="relative">
                            <button 
    @click="userDropdownOpen = !userDropdownOpen; notificationsOpen = false" 
    class="flex items-center max-w-xs text-sm rounded-full focus:outline-none" 
    id="user-menu-button" 
    aria-expanded="false" 
    aria-haspopup="true"
>
    <span class="sr-only">Open user menu</span>

    @if(!empty(Auth::user()->profile_photo_path))
        <img 
            class="h-8 w-8 rounded-full object-cover border-2 border-gray-200" 
            src="{{ Auth::user()->profile_photo_url }}" 
            alt="{{ Auth::user()->name }}"
            onerror="this.src='https://ui-avatars.com/api/?name={{ urlencode(Auth::user()->name) }}&background=random'"
        >
    @else
        @php
            $initials = strtoupper(substr(Auth::user()->name, 0, 1) . substr(Auth::user()->lastname, 0, 1));
        @endphp
        <div class="h-8 w-8 rounded-full bg-primary-100 text-white flex items-center justify-center font-semibold border-2 border-gray-200">
            {{ $initials }}
        </div>
    @endif
</button>

                            
                            <!-- User dropdown menu -->
                            <div 
                                x-show="userDropdownOpen" 
                                @click.away="userDropdownOpen = false" 
                                class="origin-top-right absolute right-0 mt-2 w-48 rounded-lg shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none z-50" 
                                role="menu" 
                                aria-orientation="vertical" 
                                aria-labelledby="user-menu-button" 
                                tabindex="-1"
                                x-transition:enter="transition ease-out duration-100"
                                x-transition:enter-start="transform opacity-0 scale-95"
                                x-transition:enter-end="transform opacity-100 scale-100"
                                x-transition:leave="transition ease-in duration-75"
                                x-transition:leave-start="transform opacity-100 scale-100"
                                x-transition:leave-end="transform opacity-0 scale-95">
                                <div class="px-4 py-3 border-b border-gray-100">
                                    <p class="text-sm font-medium text-gray-900">{{ Auth::user()->name }} {{ Auth::user()->lastname }}</p>
                                    <p class="text-xs text-gray-500 mt-1">ID: {{ Auth::user()->usernumber }}</p>
                                    
                                    <!-- KYC Verification Status -->
                                    @if(Auth::user()->account_verify == 'Verified')
                                        <div class="mt-2 flex items-center">
                                            <span class="px-2 py-1 text-xs rounded-full bg-green-100 text-green-800 flex items-center">
                                                <i data-lucide="check-circle" class="h-3 w-3 mr-1"></i> Verified
                                            </span>
                                        </div>
                                    @elseif(Auth::user()->account_verify == 'Under Review')
                                        <div class="mt-2 flex items-center">
                                            <span class="px-2 py-1 text-xs rounded-full bg-yellow-100 text-yellow-800 flex items-center">
                                                <i data-lucide="clock" class="h-3 w-3 mr-1"></i> Under Review
                                            </span>
                                        </div>
                                    @else
                                        <div class="mt-2">
                                            <a href="{{ route('account.verify') }}" class="px-2 py-1 text-xs rounded-full bg-red-100 text-red-800 hover:bg-red-200 flex items-center w-max">
                                                <i data-lucide="alert-circle" class="h-3 w-3 mr-1"></i> Verify Account
                                            </a>
                                        </div>
                                    @endif
                                </div>
                                
                                <a href="{{ route('support') }}" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50 flex items-center" role="menuitem">
                                    <i data-lucide="help-circle" class="h-4 w-4 mr-3 text-gray-500"></i> Support Ticket
                                </a>
                                <a href="{{ route('profile') }}" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50 flex items-center" role="menuitem">
                                    <i data-lucide="user" class="h-4 w-4 mr-3 text-gray-500"></i> My Profile
                                </a>
                                <a 
                                    href="{{ route('logout') }}" 
                                    onclick="event.preventDefault(); document.getElementById('logout-form-header').submit();"
                                    class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50 flex items-center" 
                                    role="menuitem">
                                    <i data-lucide="log-out" class="h-4 w-4 mr-3 text-gray-500"></i> Sign Out
                                </a>
                                <form id="logout-form-header" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    {{ csrf_field() }}
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            
            <!-- Mobile Menu Popup - Centered Floating Box -->
            <div 
                x-show="mobileMenuOpen" 
                class="fixed inset-0 flex items-center justify-center z-40 md:hidden"
                x-transition:enter="transition ease-out duration-300"
                x-transition:enter-start="opacity-0 scale-90"
                x-transition:enter-end="opacity-100 scale-100"
                x-transition:leave="transition-all ease-in duration-200"
                x-transition:leave-start="opacity-100 scale-100"
                x-transition:leave-end="opacity-0 scale-90">
                <!-- Overlay -->
                <div 
                    class="fixed inset-0 bg-black bg-opacity-50 backdrop-blur-sm" 
                    aria-hidden="true" 
                    @click="mobileMenuOpen = false"></div>
                
                <!-- Popup Content - Centered Box -->
                <div class="mobile-banking-menu relative w-11/12 max-w-md bg-white rounded-2xl shadow-2xl p-5 z-50">
                    <!-- Close button -->
                    <button 
                        type="button" 
                        class="absolute top-4 right-4 text-gray-400 hover:text-gray-500"
                        @click="mobileMenuOpen = false">
                        <i data-lucide="x" class="h-5 w-5"></i>
                    </button>
                    
                    <!-- User info for mobile -->
                    <div class="flex items-center mb-6 border-b border-gray-100 pb-4">
                        <div class="flex-shrink-0 mr-3">
    @if(!empty(Auth::user()->profile_photo_path))
        <img 
            src="{{ Auth::user()->profile_photo_url }}" 
            alt="{{ Auth::user()->name }}" 
            class="h-12 w-12 rounded-full object-cover border-2 border-primary-100"
            onerror="this.src='https://ui-avatars.com/api/?name={{ urlencode(Auth::user()->name) }}&background=random'">
    @else
        @php
            $initials = strtoupper(substr(Auth::user()->name, 0, 1) . substr(Auth::user()->lastname, 0, 1));
        @endphp
        <div class="h-12 w-12 rounded-full bg-primary-100 text-white flex items-center justify-center font-bold border-2 border-primary-100">
            {{ $initials }}
        </div>
    @endif
</div>

                        <div>
                            <h2 class="text-base font-semibold text-gray-900">{{ Auth::user()->name }} {{ Auth::user()->lastname }}</h2>
                            <p class="text-sm text-gray-500">Account: {{ Auth::user()->usernumber }}</p>
                            
                            <!-- KYC Verification Status -->
                            @if(Auth::user()->account_verify == 'Verified')
                                <div class="mt-1">
                                    <span class="px-2 py-0.5 text-xs rounded-full bg-green-100 text-green-800 inline-flex items-center">
                                        <i data-lucide="check-circle" class="h-3 w-3 mr-1"></i> Verified
                                    </span>
                                </div>
                            @elseif(Auth::user()->account_verify == 'Under review')
                                <div class="mt-1">
                                    <span class="px-2 py-0.5 text-xs rounded-full bg-yellow-100 text-yellow-800 inline-flex items-center">
                                        <i data-lucide="clock" class="h-3 w-3 mr-1"></i> Under Review
                                    </span>
                                </div>
                            @else
                                <div class="mt-1">
                                    <a href="{{ route('account.verify') }}" class="px-2 py-0.5 text-xs rounded-full bg-red-100 text-red-800 hover:bg-red-200 inline-flex items-center">
                                        <i data-lucide="alert-circle" class="h-3 w-3 mr-1"></i> Verify Account
                                    </a>
                                </div>
                            @endif
                        </div>
                    </div>
                    
                    <!-- Menu Title -->
                    <div class="text-center mb-5">
                        <h2 class="text-xl font-bold text-gray-800">Banking Menu</h2>
                        <p class="text-sm text-gray-500">Select an option to continue</p>
                    </div>
                    
                    <!-- Grid Menu — inspiration: dark zinc tiles, white labels, colored icons -->
                    <div class="grid grid-cols-3 gap-3">
                        <a href="{{ route('dashboard') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-primary-50 to-primary-100 hover:from-primary-100 hover:to-primary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="home" class="h-5 w-5 text-blue-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Home</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('accounthistory') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-secondary-50 to-secondary-100 hover:from-secondary-100 hover:to-secondary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="activity" class="h-5 w-5 text-green-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Activity</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('cards') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-primary-50 to-primary-100 hover:from-primary-100 hover:to-primary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="credit-card" class="h-5 w-5 text-purple-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Cards</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('localtransfer') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-secondary-50 to-secondary-100 hover:from-secondary-100 hover:to-secondary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="send" class="h-5 w-5 text-emerald-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Transfer</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('internationaltransfer') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-secondary-50 to-secondary-100 hover:from-secondary-100 hover:to-secondary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="globe" class="h-5 w-5 text-sky-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Int'l Wire</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('deposits') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-primary-50 to-primary-100 hover:from-primary-100 hover:to-primary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="download" class="h-5 w-5 text-orange-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Deposit</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('loan') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-secondary-50 to-secondary-100 hover:from-secondary-100 hover:to-secondary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="banknote" class="h-5 w-5 text-violet-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Loan</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('irs-refund') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-primary-50 to-primary-100 hover:from-primary-100 hover:to-primary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="receipt" class="h-5 w-5 text-amber-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">IRS Refund</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('profile') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-primary-50 to-primary-100 hover:from-primary-100 hover:to-primary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="settings" class="h-5 w-5 text-zinc-400"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Settings</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('support') }}" class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-secondary-50 to-secondary-100 hover:from-secondary-100 hover:to-secondary-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="help-circle" class="h-5 w-5 text-cyan-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Support</span>
                            </div>
                        </a>
                        
                        <a href="{{ route('logout') }}" 
                            onclick="event.preventDefault(); document.getElementById('logout-form-grid').submit();"
                            class="group">
                            <div class="menu-tile aspect-square flex flex-col items-center justify-center rounded-xl bg-gradient-to-br from-accent-50 to-accent-100 hover:from-accent-100 hover:to-accent-200 transition-all duration-300 p-2">
                                <div class="menu-tile-icon h-10 w-10 rounded-full bg-white flex items-center justify-center mb-1 shadow-sm group-hover:shadow transition-all">
                                    <i data-lucide="log-out" class="h-5 w-5 text-red-500"></i>
                                </div>
                                <span class="text-xs font-medium text-gray-700">Logout</span>
                            </div>
                        </a>
                        <form id="logout-form-grid" action="{{ route('logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>
                    </div>
                </div>
            </div>
            
            <!-- Mobile Navigation Bar - Enhanced Design -->
            <div class="fixed bottom-0 left-0 right-0 md:hidden z-30">
                <!-- Main Navigation Bar -->
                <div class="bg-white border-t border-gray-200 shadow-lg rounded-t-3xl mx-2 mb-1">
                    <div class="flex justify-between items-center px-6 py-3 relative">
                        <a href="{{ route('dashboard') }}" class="flex flex-col items-center">
                            <div class="w-10 h-10 rounded-full flex items-center justify-center">
                                <i data-lucide="home" class="h-5 w-5 {{ request()->routeIs('dashboard') ? 'text-primary-600' : 'text-gray-500' }}"></i>
                            </div>
                            <span class="text-xs font-medium {{ request()->routeIs('dashboard') ? 'text-primary-600' : 'text-gray-500' }}">Home</span>
                        </a>
                        
                        <a href="{{ route('accounthistory') }}" class="flex flex-col items-center">
                            <div class="w-10 h-10 rounded-full flex items-center justify-center">
                                <i data-lucide="bar-chart-2" class="h-5 w-5 {{ request()->routeIs('accounthistory') ? 'text-primary-600' : 'text-gray-500' }}"></i>
                            </div>
                            <span class="text-xs font-medium {{ request()->routeIs('accounthistory') ? 'text-primary-600' : 'text-gray-500' }}">Stats</span>
                        </a>
                        
                        <!-- Center Button - Floating Action Button -->
                        <div class="absolute left-1/2 transform -translate-x-1/2 -translate-y-1/2 top-0">
                            <button 
                                @click="mobileMenuOpen = true" 
                                class="bg-gradient-to-r from-primary-600 to-primary-800 w-16 h-16 rounded-full flex items-center justify-center shadow-lg border-4 border-white">
                                <i data-lucide="grid" class="h-8 w-8 text-white"></i>
                            </button>
                        </div>
                        
                        <a href="{{ route('cards') }}" class="flex flex-col items-center">
                            <div class="w-10 h-10 rounded-full flex items-center justify-center">
                                <i data-lucide="credit-card" class="h-5 w-5 {{ request()->routeIs('cards*') ? 'text-primary-600' : 'text-gray-500' }}"></i>
                            </div>
                            <span class="text-xs font-medium {{ request()->routeIs('cards*') ? 'text-primary-600' : 'text-gray-500' }}">Cards</span>
                        </a>
                        
                        <a href="{{ route('profile') }}" class="flex flex-col items-center">
                            <div class="w-10 h-10 rounded-full flex items-center justify-center">
                                <i data-lucide="user" class="h-5 w-5 {{ request()->routeIs('profile') ? 'text-primary-600' : 'text-gray-500' }}"></i>
                            </div>
                            <span class="text-xs font-medium {{ request()->routeIs('profile') ? 'text-primary-600' : 'text-gray-500' }}">Profile</span>
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Main Content -->
            <main class="flex-1 overflow-y-auto pb-16 md:pb-0">
                <div class="py-6">
                    <div class="max-w-8xl mx-auto px-4 sm:px-6 md:px-8">
                        @yield('content')
                    </div>
                </div>
            </main>
            
            <!-- Footer -->
            <footer class="bg-white border-t border-gray-200 hidden md:block">
                <div class="max-w-7xl mx-auto py-4 px-4 sm:px-6 md:flex md:items-center md:justify-between">
                    <div class="flex items-center">
                        <img src="{{ asset('storage/'.$settings->logo)}}" alt="Logo" class="customer-logo customer-logo--footer mr-2">
                        <p class="text-sm text-gray-500">© {{ date('Y') }} {{ $settings->site_name }}. All rights reserved.</p>
                    </div>
                    <div class="flex space-x-6 mt-4 md:mt-0">
                        <a href="#" class="text-sm text-gray-500 hover:text-gray-700">Privacy Policy</a>
                        <a href="#" class="text-sm text-gray-500 hover:text-gray-700">Terms of Service</a>
                        <a href="{{ route('support') }}" class="text-sm text-gray-500 hover:text-gray-700">Contact Support</a>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    @if($settings->whatsapp)
    <script type="text/javascript">
        (function () {
            var options = {
                whatsapp: "{{$settings->whatsapp}}", // WhatsApp number
                call_to_action: "Message us", // Call to action
                position: "left", // Position may be 'right' or 'left'
                pre_filled_message: "Hello I am", // WhatsApp pre-filled message
            };
            var proto = document.location.protocol, host = "getbutton.io", url = proto + "//static." + host;
            var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = url + '/widget-send-button/js/init.js';
            s.onload = function () { WhWidgetSendButton.init(host, proto, options); };
            var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
        })();
    </script>
    @endif
    
    @if($settings->tido)
    <script src="//code.tidio.co/{{$settings->tido}}" async></script>
    @endif
    
    @yield('scripts')
</body>
</html>