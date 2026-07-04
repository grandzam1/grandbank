const mix = require('laravel-mix');
const fs = require('fs');
const path = require('path');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Dashboard assets are built locally (Tailwind + Alpine + Lucide).
 | Legacy app.js entry is left available but not required for dash2.
 |
 */

mix.js('resources/js/dashboard.js', 'public/js')
    .postCss('resources/css/dashboard.css', 'public/css', [
        require('tailwindcss'),
        require('autoprefixer'),
    ])
    .options({
        processCssUrls: false,
    });

// Append dashboard base + dark-mode CSS after Tailwind so overrides win.
mix.then(() => {
    const outFile = path.join(__dirname, 'public/css/dashboard.css');
    const baseFile = path.join(__dirname, 'resources/css/dashboard-base.css');
    const darkFile = path.join(__dirname, 'resources/css/dashboard-dark.css');

    if (!fs.existsSync(outFile)) {
        return;
    }

    const built = fs.readFileSync(outFile, 'utf8');
    const base = fs.existsSync(baseFile) ? fs.readFileSync(baseFile, 'utf8') : '';
    const dark = fs.existsSync(darkFile) ? fs.readFileSync(darkFile, 'utf8') : '';

    fs.writeFileSync(outFile, `${built}\n\n/* dashboard-base */\n${base}\n\n/* dashboard-dark */\n${dark}\n`);
});

if (mix.inProduction()) {
    mix.version();
}
