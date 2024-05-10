#!/bin/bash
# export CF_DNS_APITOKEN="...."
set -e
source .env

mkdir -p /srv/openagents/
mkdir -p /srv/openagents/nostr-relay
mkdir -p /srv/openagents/letsencrypt

# Set permissions
chown 1000:1000 -Rf /srv/openagents
setfacl -d -m u:1000:rwx,g:1000:rwx  /srv/openagents

# Configure Letsencrypt
if [ "$CF_DNS_APITOKEN" != "" ]; then
   echo "dns_cloudflare_api_token = $CF_DNS_APITOKEN" > /srv/openagents/letsencrypt/cf.ini
else 
   echo "No Cloudflare DNS API Token found. Please set CF_DNS_APITOKEN environment variable"
   exit 0
fi

# Set permissions
chown 1000:1000 -Rf /srv/openagents

# Copy strfry config
cp -f strfry.conf /srv/openagents/nostr-relay/strfry.conf

docker-compose pull
docker-compose down || true
docker-compose up -d