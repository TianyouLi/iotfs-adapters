#!/bin/bash

CUR_DIR=`pwd`
BLD_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

## build thrift libraries
cd ${BLD_DIR}
cd ./deps/thrift
./configure --with-cpp=yes --with-c-glib=no --with-python=no --with-nodejs=yes
make
sudo make install

## ignore changed file
IGNORE=git update-index --assume-unchanged
cd ${BLD_DIR}
${IGNORE} deps/thrift-0.9.3/lib/csharp/test/ThriftTest/Makefile
${IGNORE} deps/thrift-0.9.3/lib/d/Makefile
${IGNORE} deps/thrift-0.9.3/lib/d/test/Makefile
${IGNORE} deps/thrift-0.9.3/lib/haxe/test/Makefile
${IGNORE} deps/thrift-0.9.3/lib/js/test/Makefile
${IGNORE} deps/thrift-0.9.3/test/c_glib/Makefile
${IGNORE} deps/thrift-0.9.3/test/cpp/Makefile
${IGNORE} deps/thrift-0.9.3/test/erl/Makefile
${IGNORE} deps/thrift-0.9.3/test/hs/Makefile
${IGNORE} deps/thrift-0.9.3/test/perl/Makefile
${IGNORE} deps/thrift-0.9.3/test/php/Makefile
${IGNORE} deps/thrift-0.9.3/test/py.tornado/Makefile
${IGNORE} deps/thrift-0.9.3/test/py.twisted/Makefile
${IGNORE} deps/thrift-0.9.3/test/py/Makefile
${IGNORE} deps/thrift-0.9.3/test/rb/Makefile
${IGNORE} deps/thrift-0.9.3/tutorial/hs/Makefile


## generate thrift cpp client
cd ${BLD_DIR}
cd ./src
thrift -r --gen cpp ../deps/service.thrift

## generate thrift nodejs server
cd ${BLD_DIR}
cd ./deps/nodenvc
thrift -r --gen js:node ../service.thrift

## build iotivity
cd ${BLD_DIR}
cd ./deps/iotivity
./build.sh

## setup onvif-thrift server
cd ${BLD_DIR}
cd ./deps/nodenvc
npm install

## build binaries
cd ${BLD_DIR}
./build/build.sh

cd ${CUR_DIR}
