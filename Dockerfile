FROM alpine:3.12

RUN apk add git

COPY . /action
ENTRYPOINT ["/action/entrypoint.sh"]
