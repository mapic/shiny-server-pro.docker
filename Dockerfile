FROM ubuntu:16.04

LABEL maintainer="knutole@mapic.io"
LABEL repository="https://github.com/mapic/shiny-server-pro.docker"
LABEL version="panda"


# 0. INSTALL DEPENDENCIES & UPGRADE
# -
# 0.1 install deps
RUN apt-get update -y
RUN apt-get install -y sudo software-properties-common apt-transport-https fish git wget curl htop nano net-tools iputils-ping
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
RUN apt-get update -y
RUN apt-get install -y nodejs
RUN npm install -g forever

# 0.2 upgrade 
RUN apt-get upgrade -y


# 1. INSTALL R
# -
# 1.1 get secure APT key
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

# 1.2 add sources
RUN sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

# 1.3 update sources
RUN sudo apt-get update -y

# 1.4 install R
RUN sudo apt-get install -y r-base r-base-dev r-recommended

# 1.5 upgrade R
RUN sudo apt-get upgrade -y

# 1.6 configure R
RUN echo 'options(download.file.method = "wget")' >> /etc/R/Rprofile.site 

# 1.7 install shiny packages
RUN sudo su - -c "R -e \"install.packages(c( \
  'devtools', \
  'gplots', \
  'httr', \
  'igraph', \
  'knitr', \
  'methods', \
  'plyr', \
  'RColorBrewer', \
  'rJava', \
  'rjson', \
  'R.methodsS3', \
  'R.oo', \
  'sqldf', \
  'stringr', \
  'testthat', \
  'XML', \
  'DT', \
  'htmlwidgets', \
  'shiny', \
  'digest', \
  'rmarkdown' \
  ), repos='https://cran.rstudio.com/')\""


# 2. INSTALL SHINY SERVER PRO
# -
# 2.1 install dependencies
RUN sudo apt-get install -y gdebi-core

# 2.2 download latest package
RUN sudo wget https://s3.amazonaws.com/rstudio-shiny-server-pro-build/ubuntu-14.04/x86_64/shiny-server-commercial-1.5.10.990-amd64.deb

# 2.3 intall shiny server pro
RUN sudo gdebi -n shiny-server-commercial-1.5.10.990-amd64.deb


# 3. CONFIGURE
# -
# 3.1 expose ports
EXPOSE 3838

# 3.2 add entrypoint
ADD ./docker-entrypoint.sh /home/

# 3.3 add workdir
WORKDIR /home/

# 3.4 add default command
CMD ["bash", "/home/docker-entrypoint.sh"]

