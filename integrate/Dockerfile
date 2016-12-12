FROM ubuntu:14.04

MAINTAINER Jeltje van Baren, jeltje.van.baren@gmail.com

#Install Essentials
RUN apt-get update && apt-get install -y \
	cmake \
	gcc \
	g++ \
	wget \
	zlib1g-dev \
	libncurses5-dev \
	libpthread-stubs0-dev

WORKDIR /opt

#Install INTEGRATE via ugly mirror link (direct link to sourceforge doesn't work; neither does the ADD command)
RUN	wget -O Integrate.0.2.6.tar.gz "http://downloads.sourceforge.net/project/integrate-fusion/INTEGRATE.0.2.6.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fintegrate-fusion%2Ffiles%2F&ts=1481578141&use_mirror=superb-sea2"
RUN	tar zxvf Integrate.0.2.6.tar.gz && \
	cd INTEGRATE_0_2_6 && \
	mkdir build && \
	cd build && \
	cmake ../Integrate -DCMAKE_BUILD_TYPE=release  && \
	make

ENV PATH /opt/INTEGRATE_0_2_6/build/bin:/usr/bin:/bin

RUN mkdir /data
WORKDIR /data

# And clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /opt/Integrate.0.2.6.tar.gz 


