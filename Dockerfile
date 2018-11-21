FROM alpine:3.7

RUN apk update \
    && apk upgrade \
    && apk add \
        bash \
        git \
        git-lfs \
        openssh \
        tini \
    && rm -rf /var/cache/apk/*

COPY git-mirror.sh /etc/periodic/15min/git-mirror
COPY ssh-config /root/.ssh/config

VOLUME /data

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["crond", "-l", "5", "-f"]

RUN chmod 600 /root/.ssh/config
