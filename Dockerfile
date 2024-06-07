FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

WORKDIR /workdir

# vimは後で消す
RUN apt-get update && \
    apt-get install -y time tzdata tree git gcc-12 g++-12 vim

ARG ACL_TAG=v1.5.1
ENV ACL_PATH="/workdir/ac-library"
RUN git clone https://github.com/atcoder/ac-library.git -b ${ACL_TAG} ${ACL_PATH}
