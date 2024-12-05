FROM docker.io/library/golang:1.22.3-alpine3.18 as build

ARG VERSION

COPY ./ /workspace

WORKDIR /workspace

RUN set -ex && \
    apk update && \
    apk add git make && \
    make all VERSION=${VERSION}

# TARGET
# =====================================================================
FROM docker.io/library/alpine:3.21

ARG VERSION=latest

LABEL org.opencontainers.image.authors="Markus Pesch" \
      org.opencontainers.image.description="Return network interface names" \
      org.opencontainers.image.documentation="https://git.cryptic.systems/volker.raschek/getidev#getidev" \
      org.opencontainers.image.title="getidev" \
      org.opencontainers.image.vendor="Markus Pesch" \
      org.opencontainers.image.version="${VERSION}"

COPY --from=build /workspace/getidev /usr/bin/getidev

ENTRYPOINT [ "/usr/bin/getidev" ]
