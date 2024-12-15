#!/bin/bash

filename='nginx-access.log'

# Top 5 most requested IPs
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' $filename | sort | uniq -c | sort -nr | awk '{print $2 "  ---> " $1 " requests"}'  | head -5


# Top 5 most requested paths
echo -e "\n"
echo "Top 5 most requested paths:"
awk '{print $7}' $filename | sort | uniq -c | sort -nr | awk '{print $2 "  ---> " $1 " requests"}'  | head -5


# Top 5 response status codes
echo -e "\n"
echo "Top 5 most response status codes:"
awk '{print $9}' $filename | sort | uniq -c | sort -nr | awk '{print $2 "  --->  " $1 " requests"}'  | head -5


# Top 5 user agents
echo -e "\n"
echo "Top 5 most user agents:"
awk '{print $12}' $filename | sort | uniq -c | sort -nr | awk '{print $2 "   ---> " $1 " requests"}'  | head -5


