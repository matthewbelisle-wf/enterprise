FROM        alpine:3.3
MAINTAINER  Steve Peak <steve@codecov.io>

RUN         apk update
RUN         apk add --upgrade python-dev supervisor nginx
COPY        supervisord.conf /supervisord.conf
COPY        nginx.conf /nginx.conf
COPY        codecov /codecov

EXPOSE      80
CMD         ["/usr/bin/supervisord -C /supervisord.conf"]
