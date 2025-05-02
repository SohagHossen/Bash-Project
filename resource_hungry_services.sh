#!/bin/bash

echo "===== Top 10 Services by Memory Usage ====="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11

echo ""
echo "===== Top 10 Services by CPU Usage ====="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11

echo ""
echo "===== Active Systemd Services Sorted by Resource Usage ====="
echo "NOTE: %MEM and %CPU based on main process of each service"

# Get all active systemd services with their main PID
systemctl list-units --type=service --state=running \
| awk '{print $1}' \
| grep '.service' \
| while read service; do
    pid=$(systemctl show -p MainPID --value "$service")
    if [ "$pid" -ne 0 ] 2>/dev/null; then
        cpu_mem=$(ps -p $pid -o %cpu,%mem --no-headers)
        echo -e "$cpu_mem\t$service"
    fi
done | sort -k1 -nr | head -n 10
