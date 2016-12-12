#Docker container for tophat2.1.1 with bowtie 2.2.9

FROM ubuntu:14.04
MAINTAINER Jeltje van Baren jeltje.van.baren@gmail.com


RUN apt-get update && apt-get install -y \
	wget \
        python \
	unzip 

RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.9/bowtie2-2.2.9-linux-x86_64.zip &&\
	unzip bowtie2-2.2.9-linux-x86_64.zip
RUN wget http://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz &&\
	tar zxvf tophat-2.1.1.Linux_x86_64.tar.gz

ENV PATH $PATH:/tophat-2.1.1.Linux_x86_64:/bowtie2-2.2.9

RUN mkdir /data
WORKDIR /data

#ENTRYPOINT ["python", "/usr/local/bin/cnvToGenes.py"]
#CMD ["--help"]

# And clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

