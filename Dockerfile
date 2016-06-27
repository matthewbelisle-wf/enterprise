FROM        alpine:3.3
MAINTAINER  Codecov <enterprise@codecov.io>

RUN         apk update
RUN         apk add --upgrade python-dev postgresql-dev supervisor nginx
COPY        src/cacert.pem /etc/ssl/cert.pem
ADD         src/ bin/

EXPOSE      22 80
CMD         ["/bin/web+worker", "-n"]
