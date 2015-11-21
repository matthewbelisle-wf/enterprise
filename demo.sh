#!/bin/bash

echo "Install Docker"
curl -sSL https://get.docker.com/ | sh

echo "Starting Docker"
sudo service docker start

echo "Retrieving droplet: Redis"
docker run --name codecov-redis -d redis

echo "Retrieving Dockedroplet: Postgdropletes"
docker run --name codecov-postgres -d postgres

# create config file
echo "Creating config file for Codecov: codecov.yml"
curl https://git.io/v4Aco > codecov.yml

echo "Retrieving droplet: Codecov Enterprise"
docker run -d -p 80:80 \
           --link codecov-redis:redis \
           --link codecov-postgres:postgres \
           -v codecov.yml:/codecov.yml \
           codecov/enterprise

ip=ifconfig | grep 'eth0:' -n1 | tail -1 | rev | cut -d' ' -f1 | rev

echo "

  _____          _
 / ____|        | |
| |     ___   __| | ___  ___ _____   __
| |    / _ \\ / _\` |/ _ \\/ __/ _ \\ \\ / /
| |___| (_) | (_| |  __/ (_| (_) \\ V /
 \\_____\\___/ \\__,_|\\___|\\___\\___/ \\_/

    Thank you for choosing Codecov!

     Please navigate to http://$ip

PS: In demo mode reports will be deleted after 48 hours
    You can request a 45 day license key to have no restrictions.
    Inquire at enterprise@codecov.io

Support: https://github.com/codecov/support

Cheers!
The Codecov Family
"
