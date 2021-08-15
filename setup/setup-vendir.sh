#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=vendir
URL="https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.21.1/vendir-linux-amd64"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

move-into-bin
