FROM ubuntu:16.04

LABEL maintainer="knutole@mapic.io"
LABEL repository="https://github.com/mapic/docker.shiny-server-pro/license-server/"


# 0. INSTALL DEPENDENCIES & UPGRADE
# -
# 0.1 install deps
RUN apt-get update -y
RUN apt-get install -y sudo software-properties-common apt-transport-https fish git wget curl htop nano 
RUN apt-get upgrade -y

# 0.2 add entrypoint
ADD ./docker-entrypoint.sh /root/


# 1. INSTALL RSTUDIO SHINY SERVER LICENSE SERVER
# -
# 1.1 download package
RUN wget https://s3.amazonaws.com/rstudio-license-server/ssp-license-server-1.0.9-x86_64.deb

# 1.2 install package
RUN yes N | sudo dpkg -i ssp-license-server-1.0.9-x86_64.deb

# 1.3 add config
ADD ./ssp-license-server.conf /etc/


# set entrypoint
ENTRYPOINT ["bash", "/root/docker-entrypoint.sh"]
