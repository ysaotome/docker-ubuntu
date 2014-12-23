FROM ubuntu:14.04

MAINTAINER Yuichi Saotome <y@sotm.jp>

# Install
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb-src http://jp.archive.ubuntu.com/ubuntu trusty main" >> /etc/apt/sources.list
RUN sed "s/main$/main universe/" -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
## make ,gcc 
RUN apt-get install -y build-essential
RUN apt-get install -y curl wget git byobu zsh htop vim
RUN rm -rf /var/lib/apt/lists/*

# Set Time Zone
RUN echo 'Asia/Tokyo' > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Add file
##ADD dotfiles/.zshrc /root/.zshhrc

# Default workdir
ENV HOME /root
WORKDIR /root

# Default command
CMD ["bash"]

