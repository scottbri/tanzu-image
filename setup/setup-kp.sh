#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=kp
URL="https://github.com/vmware-tanzu/kpack-cli/releases/download/v0.3.1/kp-linux-0.3.1"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

move-into-bin
