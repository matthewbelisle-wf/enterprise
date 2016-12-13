#!/bin/bash

# Install Docker
curl -sSL https://get.docker.com/ | sh

# Starting Docker
sudo service docker start

# Retrieving droplet: Redis
docker run --name codecov-redis -d redis

# Retrieving Dockedroplet: Postgdropletes
docker run --name codecov-postgres -d postgres

# create config file
random=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1)]

echo "# Documentation at http://docs.codecov.io/docs/configuration
setup:
  codecov_url: http://localhost:80         # This url is used to link all notifications back to Codecov (Comment/Status/etc.)
  enterprise_license: ___FILL_THIS_IN___   # Provided by Codecov Staff
  cookie_secret: $random
" > codecov.yml

VERSION=":v4.1.3"

# Retrieving droplet: Codecov Enterprise
docker run -d -p 80:80 \
           --name codecov \
           --link codecov-redis:redis \
           --link codecov-postgres:postgres \
           -v "$PWD/codecov.yml:/codecov.yml" \
           "codecov/enterprise$VERSION"

echo "

  _____          _
 / ____|        | |
| |     ___   __| | ___  ___ _____   __
| |    / _ \\ / _\` |/ _ \\/ __/ _ \\ \\ / /
| |___| (_) | (_| |  __/ (_| (_) \\ V /
 \\_____\\___/ \\__,_|\\___|\\___\\___/ \\_/


Thank you for choosing Codecov!

Server:                http://localhost:80
Configuration File:    $PWD/codecov.yml

Have a Trial License Key?
   YES: Please open your configuration and paste it in the file. Restart Codecov via $ docker restart codecov
    NO: Please contact Codecov Staff to issue a license key. Thank you!

Enjoy and please do not hesistate to ask our team anything!

<3 The Codecov Family

https://codecov.io/support
enterprise@codecov.io
"
