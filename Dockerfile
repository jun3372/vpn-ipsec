FROM debian
LABEL maintainer="哲学 <zhoujun3372@gmail.com>"

WORKDIR /opt/src

COPY ./vpnsetup.sh  /opt/src

RUN apt-get update && apt-get dist-upgrade \
    && sh /opt/src/vpnsetup.sh \
    && apt-get -yqq autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 500/udp 4500/udp

VOLUME ["/lib/modules"]

CMD [ "/opt/src/run.sh" ]
