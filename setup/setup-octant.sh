#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=octant
URL="https://github.com/vmware-tanzu/octant/releases/download/v0.23.0/octant_0.23.0_Linux-64bit.tar.gz"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

tar zxvf $FILENAME
cd octant_*_Linux-64bit
FILENAME="octant-0.23.0"
mv octant $FILENAME

move-into-bin
