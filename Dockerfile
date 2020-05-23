# Dockerfile: hombre-rsync-server

FROM hombrelab/hombre-alpine

ARG version

LABEL version="${version}"
LABEL description="RSYNC server Docker image"
LABEL maintainer="Hombrelab <me@hombrelab.com>"
LABEL inspiration="getting things done my way"

RUN apk add --no-cache \
    rsync

VOLUME /share

EXPOSE 873

CMD rsync --daemon --no-detach --log-file /dev/stdout