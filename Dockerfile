FROM ubuntu:13.04
MAINTAINER Steve Peak <steve@codecov.io>

RUN apt-get update && apt-get install -y python-psycopg2

RUN apt-get install -y supervisor
RUN mkdir /var/log/supervisor
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get install -y nginx
COPY docker/nginx.conf /nginx.conf

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
