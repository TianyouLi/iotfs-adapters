#!/bin/bash

CUR_DIR=`pwd`
BLD_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd ${BLD_DIR}

sudo apt-get update

APT="sudo apt-get install -y"

# install required libraries 
${APT} cmake autotools-dev automake


cd ${CUR_DIR}
