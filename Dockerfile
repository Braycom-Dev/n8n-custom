FROM alpine:3.22 AS tools

RUN apk add --no-cache \
    imagemagick \
    poppler-utils \
    ghostscript

FROM n8nio/n8n:2.16.1

USER root

COPY --from=tools /usr/bin/convert /usr/bin/convert
COPY --from=tools /usr/bin/magick /usr/bin/magick
COPY --from=tools /usr/bin/pdftoppm /usr/bin/pdftoppm
COPY --from=tools /usr/lib /usr/lib
COPY --from=tools /usr/share/ghostscript /usr/share/ghostscript

USER node
