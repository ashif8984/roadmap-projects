#!/bin/bash


FILENAME=$1
HOSTNAME=$2

echo "======================================="
echo -e " Deploying ..."
echo "======================================="

rsync -avh $FILENAME ashifkey@$HOSTNAME:/var/www/html/index.nginx-debian.html



status_code=$(curl -I http://$HOSTNAME 2>/dev/null | head -n 1 | cut -d$' ' -f2)

if [[ "$status_code" -eq 200 ]] ; then
  echo "The website is up & running on http://$HOSTNAME , status code: $status_code" 
else

  echo "The website is down. Response code: $response"
  exit 0
fi