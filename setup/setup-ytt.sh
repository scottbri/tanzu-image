#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=ytt
URL="https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.36.0/ytt-linux-amd64"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

move-into-bin
