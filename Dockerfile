FROM ubuntu:latest

LABEL maintainer="lcylichenyi"

ENV XMRIG_VERSION=6.8.2 \
    CPU_USAGE=90 \
    CPULIMIT_VERSION=0.2

RUN apt-get -qq update \
    &&  apt-get -qqy install --no-install-recommends wget \
    &&  cd /root \
    &&  wget --no-check-certificate -c https://github.com/xmrig/xmrig/releases/download/v${XMRIG_VERSION}/xmrig-${XMRIG_VERSION}-linux-x64.tar.gz -O xmrig.tar.gz \
    &&  tar zxvf xmrig.tar.gz  \
    &&  mv xmrig-${XMRIG_VERSION} xmrig \
    &&  rm -rf xmrig.tar.gz 

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]