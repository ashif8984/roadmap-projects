#!/bin/bash

filename='./nginx-access.log'

ip=`awk '{print $1}' filename`

for char in $ip
do
    echo "${char} - `grep -io "${char}" ${filename} | wc -l`,"
done


# Top 5 IP addresses with the most requests



# Top 5 most requested paths



# Top 5 response status codes



# Top 5 user agents

