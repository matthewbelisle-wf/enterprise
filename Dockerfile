FROM        ubuntu:14.04
MAINTAINER  Steve Peak <steve@codecov.io>

# https://docs.docker.com/v1.8/articles/using_supervisord/
RUN     apt-get update
RUN     apt-get install -y supervisor nginx
COPY    docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY    docker/nginx.conf /etc/nginx/nginx.conf

EXPOSE  22 80
CMD     ["/usr/bin/supervisord"]
