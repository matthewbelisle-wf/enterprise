FROM        ubuntu:14.04
MAINTAINER  Steve Peak <steve@codecov.io>

RUN         apt-get update
RUN         apt-get install -y supervisor nginx python-psycopg2
COPY        docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY        docker/nginx.conf /etc/nginx/nginx.conf
COPY        codecov /home/codecov

EXPOSE      5000
CMD         ["/usr/bin/supervisord"]
