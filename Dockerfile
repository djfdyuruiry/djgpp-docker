FROM ubuntu:focal

ARG GCC_VERSION=7.2.0

# ubuntu config
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# install deps
RUN apt-get update \
  && apt-get -y dist-upgrade \
  && apt-get -y install \
    bison \
    curl \
    flex \
    gcc \
    g++ \
    git \
    make \
    texinfo \
    zlib1g-dev \
    unzip \
    xz-utils

# env config
ENV DJGPP_PREFIX /usr/local/bin/djgpp
ENV DJ_PREFIX ${DJGPP_PREFIX}/bin

# checkout and run build script
RUN git clone https://github.com/andrewwutw/build-djgpp.git /tmp/build-djgpp \
  && cd /tmp/build-djgpp \
  && ./build-djgpp.sh ${GCC_VERSION} \
  && rm -rf /tmp/build-djgpp

# runtime config
RUN mkdir /src

WORKDIR /src

ENV PATH ${DJ_PREFIX}:${PATH}
ENV PATH ${DJGPP_PREFIX}/i586-pc-msdosdjgpp/bin:${PATH}
ENV PATH ${DJGPP_PREFIX}/libexec/gcc/i586-pc-msdosdjgpp/${GCC_VERSION}:${PATH}
ENV GCC_EXEC_PREFIX ${DJGPP_PREFIX}/lib/gcc/
