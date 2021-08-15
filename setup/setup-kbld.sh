#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=kbld
URL="https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.30.0/kbld-linux-amd64"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

move-into-bin
