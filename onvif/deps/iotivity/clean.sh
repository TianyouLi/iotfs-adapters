#!/bin/bash
CUR_DIR=`pwd`
BLD_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


cd ${BLD_DIR}

rm -rf iotivity

cd ${CUR_DIR}
