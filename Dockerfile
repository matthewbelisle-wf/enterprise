FROM        ubuntu:14.04
MAINTAINER  Steve Peak <steve@codecov.io>

RUN         apt-get update
RUN         apt-get install -y supervisor nginx python-psycopg2 ca-certificates
COPY        supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY        nginx.conf /etc/nginx/nginx.conf
COPY        codecov /home/codecov

EXPOSE      80
CMD         ["/usr/bin/supervisord"]
