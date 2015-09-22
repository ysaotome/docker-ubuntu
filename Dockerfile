FROM ubuntu:14.04

MAINTAINER Yuichi Saotome <y@sotm.jp>

# Install 
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb-src http://jp.archive.ubuntu.com/ubuntu trusty main" >> /etc/apt/sources.list
RUN sed "s/main$/main universe/" -i /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential language-pack-ja vim curl wget git byobu zsh unzip htop iftop iotop 
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Locale
RUN update-locale LANG=ja_JP.UTF-8

# Set Time Zone JST
RUN echo Asia/Tokyo > /etc/timezone 
RUN dpkg-reconfigure -f noninteractive tzdata

# Add file
COPY dotfiles/.zshrc /root/.zshhrc

# Default workdir
ENV HOME /root
WORKDIR /root

# Default command
CMD ["zsh"]

