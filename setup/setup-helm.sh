#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=helm
URL="https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"
tar zxvf $FILENAME
FILENAME="helm-v3.6.3"
mv linux-amd64/helm ./$FILENAME

move-into-bin
