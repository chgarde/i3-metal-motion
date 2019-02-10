FROM ubuntu:16.04

MAINTAINER Christophe Garde <christophe.garde@gmail.com>

### Install basic packages.
RUN apt-get update -qq && apt-get -qqy --no-install-recommends install \
    wget \
    tzdata \
    xz-utils \
    g++ \
    sudo 

### Install RepetierHost
WORKDIR /opt/
#COPY repetierHostLinux_2_0_5.tgz /opt/
RUN wget --no-check-certificate --quiet \
    https://data.emotion-tech.com/ftp/I3%20Metal%20Motion/Logiciels-Software/Linux/repetierHostLinux_2_0_5.tgz

RUN tar --gzip --extract -f repetierHostLinux_2_0_5.tgz
WORKDIR /opt/RepetierHost/
RUN sed -i 's/libmono-winforms2.0-cil/libmono-system-windows-forms4.0-cil/' configureFirst.sh
RUN sed -i 's/apt-get/apt-get -y --no-install-recommends/' configureFirst.sh
RUN /opt/RepetierHost/configureFirst.sh
RUN mkdir -p /root/files
VOLUME /root/files

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
