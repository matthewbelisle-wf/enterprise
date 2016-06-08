FROM        alpine:3.3
MAINTAINER  Codecov <enterprise@codecov.io>

RUN         apk update
RUN         apk add --upgrade python-dev postgresql-dev supervisor nginx
COPY        web+worker /bin/web+worker
COPY        web /bin/web
COPY        worker /bin/worker
COPY        nginx.conf /nginx.conf
COPY        codecov /codecov

EXPOSE      22 80
CMD         ["web+worker -n"]
