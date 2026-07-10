#!/usr/bin/env bash
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$APP_DIR"

for item in css dash dash2 error favicon.ico images mix-manifest.json robots.txt temp themes serviceworker.js; do
  if [ -e "$item" ] && [ ! -e "public/$item" ]; then
    ln -sfn "../$item" "public/$item"
  fi
done

mkdir -p storage/framework/cache storage/framework/sessions storage/framework/views storage/logs bootstrap/cache
chmod -R ug+rwx storage bootstrap/cache 2>/dev/null || true

if [ -f .htaccess ] && [ ! -f public/.htaccess ]; then
  cp .htaccess public/.htaccess
fi

rm -f public/storage
ln -sfn ../storage/app/public public/storage

composer install --no-dev --optimize-autoloader --no-interaction --ignore-platform-reqs

if ! php artisan migrate --force; then
  echo "migrate: skipped or partially applied (existing database)"
fi

php artisan config:clear
php artisan cache:clear
php artisan view:clear

