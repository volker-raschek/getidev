FROM scratch AS build

COPY getidev-* /usr/bin/app

ENTRYPOINT [ "/usr/bin/getidev" ]
