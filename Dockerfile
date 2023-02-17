FROM buildpack-deps:bionic

ARG UID

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    bison flex gperf automake autoconf libtool gettext perl python2.7 libgmp-dev libssl-dev \
	kmod \
	autossh \
	sudo \
	&& rm -rf /var/lib/apt/lists/*

COPY . /tmp/strongswan

WORKDIR /tmp/strongswan
RUN ./autogen.sh
RUN ./configure --enable-openssl
RUN make
RUN make install

COPY bin/vpn-* /usr/local/bin

RUN useradd -u $UID -m -d /home/app -G tty app
