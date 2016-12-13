FROM ubuntu:14.04

MAINTAINER jeltje.van.baren@gmail.com

RUN apt-get update && apt-get -y install \
	build-essential \
	zlib1g-dev \
	libncurses5-dev

ADD https://github.com/samtools/samtools/releases/download/1.3/samtools-1.3.tar.bz2 /

RUN tar xvjf samtools-1.3.tar.bz2 && \
	cd /samtools-1.3 && \
	make && \
	mv /samtools-1.3/samtools /usr/local/bin/

RUN mkdir /data
WORKDIR /data

# And clean up
RUN apt-get clean && rm -rf /samtools-1.3.tar.bz2

