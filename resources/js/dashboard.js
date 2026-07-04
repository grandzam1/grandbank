import Alpine from 'alpinejs';
import { createIcons, icons } from 'lucide';

window.Alpine = Alpine;
Alpine.start();

// Keep compatibility with Blade pages that call lucide.createIcons()
window.lucide = {
    createIcons: function () {
        createIcons({ icons });
    },
};

window.setDashboardTheme = function (theme) {
    var isDark = theme === 'dark';
    document.documentElement.classList.toggle('dark', isDark);
    try {
        localStorage.setItem('grandbank_theme', isDark ? 'dark' : 'light');
    } catch (e) {}

    document.querySelectorAll('[data-theme-toggle]').forEach(function (el) {
        if (el.type === 'checkbox') {
            el.checked = isDark;
        }
    });
    document.querySelectorAll('[data-theme-label]').forEach(function (el) {
        el.textContent = isDark ? 'Dark' : 'Light';
    });
    document.querySelectorAll('[data-theme-icon-sun]').forEach(function (el) {
        el.classList.toggle('hidden', isDark);
    });
    document.querySelectorAll('[data-theme-icon-moon]').forEach(function (el) {
        el.classList.toggle('hidden', !isDark);
    });
};

window.toggleDashboardTheme = function () {
    var next = document.documentElement.classList.contains('dark') ? 'light' : 'dark';
    window.setDashboardTheme(next);
};

function initIcons() {
    createIcons({ icons });
}

function initTheme() {
    var theme = 'light';
    try {
        theme = localStorage.getItem('grandbank_theme') === 'dark' ? 'dark' : 'light';
    } catch (e) {}
    window.setDashboardTheme(theme);
}

function initPreloader() {
    var preloader = document.querySelector('.page-loading');
    if (!preloader) {
        return;
    }

    window.setTimeout(function () {
        preloader.classList.remove('active');
        window.setTimeout(function () {
            if (preloader.parentNode) {
                preloader.remove();
            }
        }, 500);
    }, 400);
}

function updateDateTime() {
    var now = new Date();
    var timeElements = document.querySelectorAll('[data-current-time], [data-live-time]');
    var dateElements = document.querySelectorAll('[data-current-date], [data-live-date]');

    if (timeElements.length > 0) {
        var timeString = now.toLocaleTimeString(undefined, {
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
        });
        timeElements.forEach(function (el) {
            el.textContent = timeString;
        });
    }

    if (dateElements.length > 0) {
        var dateString = now.toLocaleDateString(undefined, {
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric',
        });
        dateElements.forEach(function (el) {
            el.textContent = dateString;
        });
    }
}

document.addEventListener('DOMContentLoaded', function () {
    initTheme();
    initIcons();
    initPreloader();
    updateDateTime();
    window.setInterval(updateDateTime, 60000);
});
