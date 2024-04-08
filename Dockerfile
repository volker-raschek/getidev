FROM docker.io/library/golang:1.21.6-alpine3.18

ARG VERSION

COPY ./ /workspace

RUN cd /workspace && \
    VERSION=${VERSION} \
      make all

# TARGET
# =====================================================================
FROM docker.io/library/alpine:3.19

COPY --from=build /workspace/getidev /usr/bin/getidev

ENTRYPOINT [ "/usr/bin/getidev" ]
