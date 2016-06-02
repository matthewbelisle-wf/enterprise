FROM        alpine:3.3
MAINTAINER  Steve Peak <steve@codecov.io>

RUN         apt-get update
RUN         apt-get install -y python-dev supervisor nginx
COPY        supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY        nginx.conf /etc/nginx/nginx.conf
COPY        codecov /home/codecov

EXPOSE      80
CMD         ["/usr/bin/supervisord"]
