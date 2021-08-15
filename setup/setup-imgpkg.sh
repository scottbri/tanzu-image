#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=imgpkg
URL="https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.17.0/imgpkg-linux-amd64"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

move-into-bin
