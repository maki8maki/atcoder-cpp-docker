FROM python:3.11-slim-bookworm

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

WORKDIR /workdir

# vimは後で消す
ARG GCC_VERSION=12
RUN apt-get update && apt-get install -y \
    gcc-${GCC_VERSION} \
    g++-${GCC_VERSION} \
    git \
    time \
    tree \
    tzdata \
    vim

RUN echo "alias g++='gcc-${GCC_VERSION}'" >> ~/.bashrc && \
    echo "alias g++='g++-${GCC_VERSION}'" >> ~/.bashrc

ARG ACL_TAG=v1.5.1
ENV ACL_PATH="/workdir/ac-library"
RUN git clone https://github.com/atcoder/ac-library.git -b ${ACL_TAG} ${ACL_PATH}

# atcoder-toolsのエラーを防ぐためにmarkupsafeのバージョンを指定してインストール
# see https://keep-loving-python.hatenablog.com/entry/2022/08/29/121515
RUN pip3 install atcoder-tools markupsafe==2.0.1

# pythonイメージの上書き
CMD ["/bin/bash"]
