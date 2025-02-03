#!/bin/bash

# Path to the my.cnf file
my_cnf_path="/etc/my.cnf"

# Check if the file exists
if [[ ! -f "$my_cnf_path" ]]; then
  echo "Error: $my_cnf_path does not exist."
  exit 1
fi

# Use sed to insert the new line after the specified line
sudo sed -i '/innodb_file_per_table = 1/a mysql_mode = ""' "$my_cnf_path"

# Restart MySQL/MariaDB to apply changes
if sudo systemctl restart mysql 2>/dev/null; then
  echo "MySQL restarted successfully."
elif sudo systemctl restart mariadb 2>/dev/null; then
  echo "MariaDB restarted successfully."
else
  echo "Failed to restart MySQL/MariaDB. Please restart manually."
fi

echo "my.cnf updated successfully."