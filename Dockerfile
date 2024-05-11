# syntax=docker/dockerfile:1
#
ARG IMAGEBASE=frommakefile
#
FROM ${IMAGEBASE}
#
RUN set -xe \
    && apk add --no-cache --purge -uU \
        dbus-x11 \
        font-ubuntu \
        icu-libs \
        iso-codes \
        linux-firmware-i915 \
        mesa-dri-gallium \
        mesa-gl \
        mesa-va-gallium \
        mesa-vulkan-swrast \
        ttf-font-awesome \
        ttf-freefont \
        ttf-inconsolata \
        ttf-opensans \
    # && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    # && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    # && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    # && apk add --no-cache --purge -u \
        gimp \
    && rm -rf /var/cache/apk/* /tmp/*
#
COPY root/ /
#
VOLUME /home/${S6_USER:-alpine}/ /home/${S6_USER}/Pictures/
#
# WORKDIR /home/${S6_USER:-alpine}/
#
ENTRYPOINT ["/usershell"]
CMD ["/usr/bin/gimp"]
