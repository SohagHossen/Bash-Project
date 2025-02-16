#!/bin/bash

# Define the path to the php.ini file
PHP_INI="/opt/cpanel/ea-php74/root/etc/php.ini"

# Define the new values
UPLOAD_MAX_FILESIZE="128M"
POST_MAX_SIZE="128M"
MEMORY_LIMIT="256M"

# Update upload_max_filesize
sed -i "s/^upload_max_filesize = .*/upload_max_filesize = $UPLOAD_MAX_FILESIZE/" "$PHP_INI"

# Update post_max_size
sed -i "s/^post_max_size = .*/post_max_size = $POST_MAX_SIZE/" "$PHP_INI"

# Update memory_limit
sed -i "s/^memory_limit = .*/memory_limit = $MEMORY_LIMIT/" "$PHP_INI"

# Restart Apache to apply changes
systemctl restart apache2

echo "PHP configuration updated successfully:"
echo "upload_max_filesize = $UPLOAD_MAX_FILESIZE"
echo "post_max_size = $POST_MAX_SIZE"
echo "memory_limit = $MEMORY_LIMIT"