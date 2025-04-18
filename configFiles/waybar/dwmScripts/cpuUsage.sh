#!/bin/bash

#echo $(mpstat -P ALL | grep all | awk '{print $4}')%
#iostat -c | awk '/avg-cpu:/{getline; print ""$1""}'

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
cpu_usage=${cpu_usage%.*}
echo "$cpu_usage%"
