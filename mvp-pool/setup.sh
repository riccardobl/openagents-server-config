#!/bin/bash
# export CF_DNS_APITOKEN="...."
set -e

mkdir -p /srv/openagents/letsencrypt


# Configure Letsencrypt
if [ "$CF_DNS_APITOKEN" != "" ]; then
   echo "dns_cloudflare_api_token = $CF_DNS_APITOKEN" > /srv/openagents/letsencrypt/cf.ini
else 
   echo "No Cloudflare DNS API Token found. Please set CF_DNS_APITOKEN environment variable"
   exit 0
fi

# Set permissions
chown 1000:1000 -Rf /srv/openagents


docker-compose pull
docker-compose down || true
docker-compose up -d