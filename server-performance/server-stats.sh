#!/bin/bash

# All server performance metrics

# Total CPU usage
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage ""}')

# Percentage of memory usage
mem_used=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Percentage of memory free
mem_free=$(free | grep Mem | awk '{print $4/$2 * 100.0}')

# Percentage of disk free
disk_free=$(df -h --total | grep total | awk '{print $4/$2 * 100}')

# Percentage of disk usage
disk_usage=$(df -h --total | grep total | awk '{print $3/$2 * 100.0}')

# Top 5 process based on CPU%
process_by_cpu=$(ps -e -o pid,cmd,%cpu --sort=-%cpu | head -n 6)

# Top 5 process based on memory%
process_by_mem=$(ps -e -o pid,cmd,%mem --sort=-%cpu | head -n 6)

# Os-Release versiom
os_version=$(grep -E '^(NAME)=' /etc/os-release | sed 's/NAME=//g' | sed 's/"//g')

# Uptime of the Server
uptime=$(uptime | awk '{print $1}')

# Current logged in User
user=$(whoami)

# Load average of the server
load_avg=$(uptime  | grep -oP '(?<=average:).*')

# Failed login attempt
failed_login=$(grep "Failed password" /var/log/auth.log)


MYCUSTOMTAB='\t\t\t'
echo "======================================="
echo -e " Metrics \t\t Value"
echo "======================================="

printf '%b' "CPU: ${MYCUSTOMTAB}$cpu \n"
printf '%b' "Memory Used: ${MYCUSTOMTAB}$mem_used \n"
printf '%b' "Memory Free: ${MYCUSTOMTAB}$mem_free \n"
printf '%b' "Disk Used: ${MYCUSTOMTAB}$disk_usage \n"
printf '%b' "Disk Free: ${MYCUSTOMTAB}$disk_free \n"


echo "---------------------------------------"
echo -e "Top 5 process by CPU"
echo "---------------------------------------"
ps -e -o pid,cmd,%cpu --sort=-%cpu | head -n 6


echo "---------------------------------------"
echo -e "Top 5 process by Memory"
echo "---------------------------------------"
ps -e -o pid,cmd,%mem --sort=-%cpu | head -n 6



echo "---------------------------------------"
echo -e "Other Information"
echo "---------------------------------------"
printf '%b' "OS-Version: ${MYCUSTOMTAB}$os_version \n"
printf '%b' "Uptime: ${MYCUSTOMTAB}$uptime \n"
printf '%b' "Current User: ${MYCUSTOMTAB}$user \n"
printf '%b' "Load Average: ${MYCUSTOMTAB}$load_avg \n"
printf '%b' "Failed Login: ${MYCUSTOMTAB}$failed_login \n"

echo "---------------------------------------"