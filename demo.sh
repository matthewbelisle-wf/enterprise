# install docker
curl -sSL https://get.docker.com/ | sh

# start docker
sudo service docker start

# pull Codecov Enterprise
docker pull codecov/enterprise

# create config file
curl http://git.io/v4Aco > codecov.yml

# Start Codecov
docker run -d -p 80:80 -v codecov.yml:/codecov.yml codecov/enterprise

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
