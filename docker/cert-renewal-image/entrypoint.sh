#!/bin/bash

# Change test-cert when ready
printf "a\ny\n1" | certbot certonly --standalone --test-cert -m "kyle.blue.nuttall@gmail.com" -d "$WEBSITE" # Change "bitmemo.io" if using other website
cd "/etc/letsencrypt/live/$WEBSITE/";

shopt -s globstar # Enable globs
sed -i '' *.pem; # This replaces all system links with their actual files

cd /create_secrets
source ./venv/bin/activate
python3 ./src/create_secrets.py