FROM debian:jessie
MAINTAINER Victor <victor@me.com>

RUN adduser --disabled-password docker

VOLUME /home/docker/data
EXPOSE 8080

#this should be picked up by recollindex
ENV RECOLL_CONFDIR /home/docker/data/.recoll 

RUN echo deb http://www.lesbonscomptes.com/recoll/debian/ unstable main > \
	/etc/apt/sources.list.d/recoll.list

RUN echo deb-src http://www.lesbonscomptes.com/recoll/debian/ unstable main >> \
	/etc/apt/sources.list.d/recoll.list

RUN apt-get update && \
	apt-get install -y --force-yes locales
# Set the locale
#http://jaredmarkell.com/docker-and-locales/
RUN locale-gen de_DE.UTF-8  
ENV LANG de_DE.UTF-8  
ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8 


RUN apt-get update && \
    apt-get install -y --force-yes recoll python-recoll python git wv poppler-utils && \
    apt-get clean



RUN git clone https://github.com/viktor-c/recoll-webui.git -b viktor /home/docker/recoll-webui/

# copy all the scripts [Start]
COPY ./scripts/ /opt/install
# install the scripts
RUN /opt/install/install_command
# copy all the scripts [End]

USER docker
COPY recoll.conf /home/docker/data/.recoll/
CMD ["/usr/local/bin/startrecoll.sh"]
