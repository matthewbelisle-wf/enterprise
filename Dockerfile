FROM            alpine:3.5
MAINTAINER      Codecov <enterprise@codecov.io>

RUN             apk add --no-cache --upgrade python-dev postgresql-dev curl openssl
RUN             mkdir /config
COPY            docker/cacert.pem /config/cacert.pem
COPY            docker/run /bin/run
COPY            docker/codecov /bin/codecov

EXPOSE          80 443
CMD             ["/bin/run", "config"]
HEALTHCHECK     CMD ["/bin/run", "check"]
