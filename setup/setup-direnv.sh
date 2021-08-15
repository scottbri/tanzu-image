#!/bin/bash

. ./GLOBALS.sh
WORKDIR="${PWD}"

### function from GLOBALS
do-checks

BINARY=direnv
URL="https://github.com/direnv/direnv/releases/download/v2.28.0/direnv.linux-amd64"

FILENAME=${URL##*/}

cd ${TEMPDIR}
wget "$URL"

### function from GLOBALS
### expects FILENAME to be the source binary filename
### exp3ects BINARY to be the target final binary filename (link)
move-into-bin

