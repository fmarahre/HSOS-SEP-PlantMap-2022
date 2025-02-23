#! /bin/bash

echo '#enable noninteractive installs'
export DEBIAN_FRONTEND="noninteractive"

echo '#install other required tools'
apt-get -qq update && apt-get -qq install -y -o=Dpkg::Use-Pty=0 \
        bash-completion \
        autoconf \
        automake \
        libtool \
        curl \
        make \
        flex \
        bison \
        g++ \
        gdb \
        unzip \
        git \
        sudo \
        ssh \
        build-essential \
        pkg-config

echo '# install pre-commit hooks to /root/.cache/pre-commit/'
apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    git \
    python3-pip \
    ruby shellcheck \
    clang-format-10 \
    python3-catkin-lint

pip3 install --upgrade pip
pip3 install pre-commit

echo '####################################################'
echo '#install cmake'
echo '####################################################'
bash <(curl -s https://apt.kitware.com/kitware-archive.sh)
apt-get update -q && apt-get install -qy cmake

# echo '####################################################'
# echo '#install flatbuffer'
# echo '####################################################'
# wget https://github.com/google/flatbuffers/archive/refs/tags/v2.0.0.tar.gz
# tar -xf v2.0.0.tar.gz
# mkdir flatbuffers-2.0.0/build
# cd flatbuffers-2.0.0/build  || exit 1
# cmake ..
# make -j"$(nproc)"
# make install

# cd ../..  || exit 1
# rm -rf flatbuffers-2.0.0 v2.0.0.tar.gz

# echo '####################################################'
# echo '#install protobuf via precompiled binaries from github'
# echo '####################################################'
# PB_REL="https://github.com/protocolbuffers/protobuf/releases"
# PB_VER="3.15.6"
# curl -LO $PB_REL/download/v$PB_VER/protobuf-cpp-$PB_VER.zip
# unzip protobuf-cpp-$PB_VER.zip
# cd protobuf-$PB_VER || exit 1
# ./configure --prefix=/usr

# make -j"$(nproc)"
# make check -j"$(nproc)"
# make install
# ldconfig # refresh shared library cache.

# echo '#remove protobuf code'
# cd .. || exit 1
# rm protobuf-cpp-$PB_VER.zip
# rm -rf protobuf-$PB_VER

# echo '####################################################'
# echo '#install gRPC'
# echo '####################################################'

# #non-local install dirs (in docker installed globally)
# #create install dir and add to path
# #export GRPC_INSTALL_DIR=/grpc
# #mkdir ${GRPC_INSTALL_DIR}
# #export PATH="$PATH:$GRPC_INSTALL_DIR/bin"

# echo '#clone the grpc repo'
# git clone --recurse-submodules --depth 1 -b v1.35.0 https://github.com/grpc/grpc

# echo '#build and install gRPC and Protocol Buffers'
# cd grpc || exit 1
# mkdir -p cmake/build
# pushd cmake/build || exit 1
# cmake -DgRPC_INSTALL=ON \
#     -DgRPC_BUILD_TESTS=OFF \
#     ../..
# make -j"$(nproc)"
# make install
# popd || exit 1

# echo '#remove gRPC code'
# cd .. || exit 1
# rm -rf grpc

# echo '#install python3 grpcio_tools'
# pip3 install grpcio-tools

# echo '#updating python proto stuff'
# pip3 install --upgrade protobuf

echo '####################################################'
echo '#misc'
echo '####################################################'
# apt-get update && apt install
# TOD Vue, Django
#####*BACKEND*#####
echo '####################################################'
echo '#INSTALL BACKEND'
echo '####################################################'

echo '### - django - ###'
pip3 install django==4.0
pip3 install djangorestframework
pip3 install django-cors-headers

#####*FRONTEND*#####
echo '####################################################'
echo '#INSTALL FRONTEND'
echo '####################################################'

##Test##

echo '### - npm - ###'
apt-get update -q && apt-get install -qy npm

echo '### - nodejs 14.x - ###'
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install nodejs -y

echo '### - create-vue - ###'
npm install -g create-vue

echo '### - axios - ###'
npm install --save axios
npm install --save vue-axios

echo '### - leaflet - ###'
npm i leaflet
npm i @types/leaflet

echo '####################################################'
echo '#install gRPC'
echo '####################################################'
pip3 install grpcio
pip3 install grpcio-tools

# remove apt lists so that they are not saved in the image layers
rm -rf /var/lib/apt/lists/*
