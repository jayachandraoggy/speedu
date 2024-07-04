FROM alpine:3
LABEL maintainer "Jaya Chandra <jayachandraoggy@gmail.com>"
LABEL name "speedu"
LABEL version "1.0"

RUN apk --no-cache add transmission-daemon \
    transmission-cli \
    transmission-extra \
    transmission-remote \
    && mkdir -p /transmission/config \
    && chmod -R 1777 /transmission \
    && rm -rf /tmp/*

HEALTHCHECK --interval=60s --timeout=15s \
            CMD netstat -lntp | grep -q '0\.0\.0\.0:9091'

# ports and volumes
EXPOSE 9091 51413/tcp 51413/udp
STOPSIGNAL SIGTERM
ENTRYPOINT ["/usr/bin/transmission-daemon", "--foreground", "--config-dir", "/transmission/config"]