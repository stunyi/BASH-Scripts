#!/bin/bash

echo "We are currently in directory: $PWD"
echo "Current filename: $0"
echo "My machine is called: $HOSTNAME"
echo "I run on bash version: $BASH_VERSION"

kernel_version=$(uname -r)
echo "My kernel is version: $kernel_version" 

# Processor details
#architecture
#processor_speed
#no_of_processors
echo "Processor details: $(lscpu | grep -i 'architecture'), $(lscpu | grep -i 'mhz'), $(lscpu | grep -i 'model name')" 

# Memory details
total_memory=$(vmstat -s | grep -i "total memory" | awk '{print $1}')
used_memory=$(vmstat -s | grep -i "used memory" | awk '{print $1}')
free_memory=$(vmstat -s | grep -i "free memory" | awk '{print $1}')
echo "Main memory: $used_memory / $total_memory"

# Show all the Disks attached to machine and there space
echo "List of Available disks"
echo "====================================="
for disk in $(df -h . | grep dev | awk '{print $1}')
do
percentage_use=$(df -h . | grep dev | awk '{print $5}')
total_disk_space=$(df -h . | grep dev | awk '{print $2}')
actual_disk_usage=$(df -h . | grep dev | awk '{print $3}')
actual_disk_unused=$(df -h . | grep dev | awk '{print $4}')
echo "Disk: $disk, space:  $actual_disk_usage/$total_disk_space($percentage_use)"
done

echo "IP address: $(ifconfig eth0 | grep "inet" | grep -v "inet6" | awk '{print $2}')"
