FROM python:3-slim as build

RUN apt-get update && \
    apt-get -y install \
    build-essential \
    wget \
    cmake \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/libgit2/libgit2/archive/refs/tags/v1.5.2.tar.gz
RUN tar xzf v1.5.2.tar.gz
RUN cd libgit2-1.5.2 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    cmake --build . && \
    make install