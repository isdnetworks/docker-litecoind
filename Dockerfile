FROM isdnetworks/centos:8-ko
LABEL maintainer="is:-D Networks Docker Maintainers <jhcheong@isdnetworks.pe.kr>"

ADD litecoin-0.18.1-x86_64-linux-gnu.tar.gz /usr/local/
WORKDIR /usr/local/litecoin-0.18.1
RUN chown -R 0:0 . \
 && cp bin/* /usr/bin \
 && cp share/man/man1/* /usr/share/man/man1 \
 && cd .. \
 && rm -rf litecoin-0.18.1 \
 && useradd -m -s /bin/bash -u 1000 litecoin

WORKDIR /home/litecoin
USER litecoin
RUN mkdir .litecoin \
 && chmod 700 .litecoin

VOLUME ["/home/litecoin/.litecoin"]

EXPOSE 9333/tcp 9333/udp 9332/tcp 19335/tcp 19335/udp 19332/tcp 19444/tcp 19444/udp 19443/tcp

CMD ["litecoind", "-printtoconsole", "-nodebuglogfile"]

