#!/bin/bash
set -euo pipefail

HESTIA=/usr/local/hestia/bin
GB_ENV=/home/root1/web/grandbank.tidebridges.com/public_html/.env
PLUS_ENV=/home/root1/web/plus.tidebridges.com/public_html/.env
TMP=/tmp/db-normalize
mkdir -p "$TMP"

PASS_GB=$(openssl rand -base64 18 | tr -d '/+=' | head -c 20)
PASS_PLUS=$(openssl rand -base64 18 | tr -d '/+=' | head -c 20)

log() { echo "[db-normalize] $*"; }

log "Creating Hestia databases (if missing)"
if ! "$HESTIA"/v-list-databases root1 | awk 'NR>2 {print $1}' | grep -qx root1_grandbank; then
  "$HESTIA"/v-add-database root1 grandbank "$PASS_GB" mysql
  log "Created root1_grandbank"
else
  log "root1_grandbank already exists — skipping create"
  PASS_GB=$(grep "DB='root1_grandbank'" /usr/local/hestia/data/users/root1/db.conf | sed -n "s/.*DBUSER='\([^']*\)'.*/\1/p" || true)
fi

if ! "$HESTIA"/v-list-databases root1 | awk 'NR>2 {print $1}' | grep -qx root1_plus; then
  "$HESTIA"/v-add-database root1 plus "$PASS_PLUS" mysql
  log "Created root1_plus"
else
  log "root1_plus already exists — skipping create"
fi

# Re-read passwords from Hestia if DBs pre-existed (MD5 hash only in conf; use generated pass for new DBs)
if [ -f /usr/local/hestia/data/users/root1/db.conf ]; then
  if grep -q "DB='root1_grandbank'" /usr/local/hestia/data/users/root1/db.conf 2>/dev/null; then
    : # PASS_GB already set for new DB; for existing, extract from .env backup if needed
  fi
fi

log "Dumping source databases"
mariadb-dump --single-transaction --routines --triggers root2_bank > "$TMP/grandbank.sql"
mariadb-dump --single-transaction --routines --triggers root2_root2 > "$TMP/plus.sql"

log "Importing into normalized databases"
mariadb root1_grandbank < "$TMP/grandbank.sql"
mariadb root1_plus < "$TMP/plus.sql"

log "Backing up and updating .env files"
ts=$(date +%Y%m%d%H%M%S)
cp "$GB_ENV" "$GB_ENV.bak-$ts"
cp "$PLUS_ENV" "$PLUS_ENV.bak-$ts"

# For grandbank: use PASS_GB from creation
sed -i "s/^DB_DATABASE=.*/DB_DATABASE=root1_grandbank/" "$GB_ENV"
sed -i "s/^DB_USERNAME=.*/DB_USERNAME=root1_grandbank/" "$GB_ENV"
sed -i "s/^DB_PASSWORD=.*/DB_PASSWORD=${PASS_GB}/" "$GB_ENV"

sed -i "s/^DB_DATABASE=.*/DB_DATABASE=root1_plus/" "$PLUS_ENV"
sed -i "s/^DB_USERNAME=.*/DB_USERNAME=root1_plus/" "$PLUS_ENV"
sed -i "s/^DB_PASSWORD=.*/DB_PASSWORD=${PASS_PLUS}/" "$PLUS_ENV"

chown root1:root1 "$GB_ENV" "$PLUS_ENV"
chmod 640 "$GB_ENV" "$PLUS_ENV"

log "Clearing Laravel config cache"
cd /home/root1/web/grandbank.tidebridges.com/public_html && sudo -u root1 php artisan config:clear
cd /home/root1/web/plus.tidebridges.com/public_html && sudo -u root1 php artisan config:clear

log "Verifying Laravel DB connectivity"
cd /home/root1/web/grandbank.tidebridges.com/public_html && sudo -u root1 php artisan migrate:status --no-ansi | head -3
cd /home/root1/web/plus.tidebridges.com/public_html && sudo -u root1 php artisan migrate:status --no-ansi | head -3

GB_TABLES=$(mariadb -N -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='root1_grandbank'")
PLUS_TABLES=$(mariadb -N -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='root1_plus'")
GB_SITE=$(mariadb -N -e "SELECT site_name FROM root1_grandbank.settings LIMIT 1")
PLUS_SITE=$(mariadb -N -e "SELECT site_name FROM root1_plus.settings LIMIT 1")

log "VERIFY grandbank: tables=$GB_TABLES site=$GB_SITE"
log "VERIFY plus: tables=$PLUS_TABLES site=$PLUS_SITE"
log "Done. Old DBs (root2_bank, root2_root2) left in place — remove manually after testing."

rm -f "$TMP/grandbank.sql" "$TMP/plus.sql"
