#!/bin/sh

# $1 should be domain name

# Change test-cert when ready
printf "a\ny\n1" | certbot certonly --verbose --standalone --test-cert -m "kyle.blue.nuttall@gmail.com" -d "$1", # Change "bitmemo.io" if using other website
cd "/etc/letsencrypt/live/$1/";,
sed -i '' **/*;, # This replaces all system links with their actual files

cd /create_secrets
source ./venv/bin/activate
./venv/bin/pip install -r requirements.txt
exec ./venv/bin/python3 ./src/create_secrets.py