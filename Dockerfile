FROM        alpine:3.4
MAINTAINER  Codecov <enterprise@codecov.io>

RUN         apk update
RUN         apk add --upgrade python-dev postgresql-dev supervisor nginx
COPY        src/cacert.pem /etc/ssl/cert.pem
COPY        src/web+worker /bin/web+worker
COPY        src/web /bin/web
COPY        src/worker /bin/worker
COPY        src/config /bin/config
COPY        src/http.nginx.conf /http.nginx.conf
COPY        src/https.nginx.conf /https.nginx.conf
COPY        src/mime.types /mime.types
COPY        src/codecov /codecov

EXPOSE      22 80
CMD         ["/bin/web+worker", "-n"]
