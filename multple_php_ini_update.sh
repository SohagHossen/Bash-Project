#!/bin/bash

# Define the PHP versions and their php.ini paths
PHP73_INI="/opt/cpanel/ea-php73/root/etc/php.ini"
PHP74_INI="/opt/cpanel/ea-php74/root/etc/php.ini"

# Define the new values
UPLOAD_MAX_FILESIZE="128M"
POST_MAX_SIZE="128M"
MEMORY_LIMIT="256M"

# Function to update a php.ini file
update_php_ini() {
  local php_ini="$1"
  
  # Backup the original php.ini file
  cp "$php_ini" "${php_ini}.bak"
  
  # Update the directives using sed
  sed -i "s/^upload_max_filesize = .*/upload_max_filesize = $UPLOAD_MAX_FILESIZE/" "$php_ini"
  sed -i "s/^post_max_size = .*/post_max_size = $POST_MAX_SIZE/" "$php_ini"
  sed -i "s/^memory_limit = .*/memory_limit = $MEMORY_LIMIT/" "$php_ini"
  
  echo "Updated $php_ini"
}

# Update PHP 7.3
update_php_ini "$PHP73_INI"

# Update PHP 7.4
update_php_ini "$PHP74_INI"

# Restart PHP-FPM services (adjust based on your setup)
systemctl restart php-fpm73
systemctl restart php-fpm74

echo "PHP configuration updated and services restarted."
