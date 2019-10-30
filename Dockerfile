FROM debian
LABEL maintainer="哲学 <zhoujun3372@gmail.com>"

WORKDIR /opt/src

RUN apt-get update && apt-get dist-upgrade \
     && curl https://raw.githubusercontent.com/hwdsl2/setup-ipsec-vpn/master/vpnsetup.sh -o vpnsetup.sh \
     && sudo sh vpnsetup.sh \
     && apt-get -yqq autoremove \
     && apt-get -y clean \
     && rm -rf /var/lib/apt/lists/*

EXPOSE 500/udp 4500/udp

VOLUME ["/lib/modules"]

ENTRYPOINT [ "/opt/src/run.sh" ]
