ARG BASE_IMAGE
ARG BUILD_IMAGE

# BUILD
# =====================================================================
FROM ${BUILD_IMAGE} AS build

ARG VERSION

COPY ./ /workspace

RUN cd /workspace && \
    VERSION=${VERSION} \
      make all

# TARGET
# =====================================================================
FROM ${BASE_IMAGE}

COPY --from=build /workspace/getidev /usr/bin/getidev

ENTRYPOINT [ "/usr/bin/getidev" ]
