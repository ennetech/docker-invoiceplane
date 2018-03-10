#!/usr/bin/env bash
echo "Copy configuration:"
cp /webroot/public/ipconfig.php.example /webroot/public/ipconfig.php

echo "Configuring..."
sed -i "s/^REMOVE_INDEXPHP=.*$/REMOVE_INDEXPHP=true/" /webroot/public/ipconfig.php

sed -i "s/^IP_URL=.*$/IP_URL=$APP_URL/" /webroot/public/ipconfig.php

sed -i "s/^DB_HOSTNAME=.*$/DB_HOSTNAME=$DB_HOSTNAME/" /webroot/public/ipconfig.php
sed -i "s/^DB_USERNAME=.*$/DB_USERNAME=$DB_USERNAME/" /webroot/public/ipconfig.php
sed -i "s/^DB_PASSWORD=.*$/DB_PASSWORD=$DB_PASSWORD/" /webroot/public/ipconfig.php
sed -i "s/^DB_DATABASE=.*$/DB_DATABASE=$DB_DATABASE/" /webroot/public/ipconfig.php
sed -i "s/^DB_PORT=.*$/DB_PORT=$DB_PORT/" /webroot/public/ipconfig.php

sed -i "s/^ENCRYPTION_KEY=.*$/ENCRYPTION_KEY=$ENC_KEY/" /webroot/public/ipconfig.php
sed -i "s/^SETUP_COMPLETED=.*$/SETUP_COMPLETED=true/" /webroot/public/ipconfig.php
sed -i "s/^DISABLE_SETUP=.*$/DISABLE_SETUP=true/" /webroot/public/ipconfig.php

echo "Running..."
chown -R www-data: /webroot
supervisord -c /supervisor.conf