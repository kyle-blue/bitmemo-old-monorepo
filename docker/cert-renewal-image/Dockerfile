FROM python:3.7.7-alpine3.11

LABEL maintainer="kyle.blue.nuttall@gmail.com"

RUN apk update && \
    apk upgrade && \
    apk add certbot

COPY ./create_secrets /create_secrets
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]