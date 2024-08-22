
FROM ubuntu:16.04

RUN export http_proxy=http://192.168.137.1:7890
RUN export https_proxy=http://192.168.137.1:7890
RUN export socks_proxy=socks5://192.168.137.1:7890

RUN \
    apt-get update --yes && \
    apt-get install --no-install-recommends --yes \
    binutils gcc aria2 git cmake build-essential ninja-build curl

RUN apt-get clean autoclean && \
  apt-get autoremove --yes && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/
