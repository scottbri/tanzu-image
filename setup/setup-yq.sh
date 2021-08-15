#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=yq
URL="https://github.com/mikefarah/yq/releases/download/v4.11.2/yq_linux_amd64"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

move-into-bin
