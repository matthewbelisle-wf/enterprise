#!/bin/bash

VERSION="v4.1.3"

# download codecov-compose
curl -s "https://raw.githubusercontent.com/codecov/enterprise/compose-assets/$VERSION/codecov-compose.yml"

# download nginx config
curl -s "https://raw.githubusercontent.com/codecov/enterprise/compose-assets/$VERSION/nginx.config"

# create config file
random=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1)
random2=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1)

echo "# Documentation at http://docs.codecov.io/docs/configuration
setup:
  codecov_url: http://localhost:80           # Replace this url with where Codecov resolves to
  enterprise_license: '<your-license-key>'   # Provided by Codecov Staff
  cookie_secret: $random

site:
  # Site wide codecov.yml defaults
  # Docs: https://docs.codecov.io/docs/codecov-yaml
  coverage:
    precision: 2
    round: down
    range: '70...100'

    status:
      project: yes
      patch: yes
      changes: no

  parsers:
    gcov:
      branch_detection:
        conditional: yes
        loop: yes
        method: no
        macro: no

  comment:
    layout: 'reach, diff, flags, files'
    behavior: default
    require_changes: no
" > codecov.enterprise.yml


# Start Codecov
docker-compose up -d

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
