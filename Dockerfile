FROM        alpine:3.4
MAINTAINER  Codecov <enterprise@codecov.io>

RUN         apk update
RUN         apk add --no-cache --upgrade python-dev postgresql-dev supervisor nginx
COPY        docker/cacert.pem /etc/ssl/cert.pem
COPY        docker/web+worker /bin/web+worker
COPY        docker/web /bin/web
COPY        docker/worker /bin/worker
COPY        docker/config /bin/config
COPY        docker/http.nginx.conf /http.nginx.conf
COPY        docker/https.nginx.conf /https.nginx.conf
COPY        docker/mime.types /mime.types
COPY        docker/codecov /codecov

EXPOSE      22 80
CMD         ["/bin/web+worker", "-n"]
