#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

do-checks

BINARY=jq
URL="https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

move-into-bin
