FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

WORKDIR /workdir

# vimは後で消す
RUN apt-get update && apt-get install -y \
    gcc-12 \
    g++-12 \
    git \
    time \
    tree \
    tzdata \
    vim

ARG ACL_TAG=v1.5.1
ENV ACL_PATH="/workdir/ac-library"
RUN git clone https://github.com/atcoder/ac-library.git -b ${ACL_TAG} ${ACL_PATH}
