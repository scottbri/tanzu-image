#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=kapp
URL="https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.37.0/kapp-linux-amd64"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

move-into-bin
