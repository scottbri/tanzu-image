#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

### function from GLOBALS
do-checks

BINARY=kubeseal
URL="https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/kubeseal-linux-amd64"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

### function from GLOBALS
### expects FILENAME to be the source binary filename
### exp3ects BINARY to be the target final binary filename (link)
move-into-bin

