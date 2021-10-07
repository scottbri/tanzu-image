#!/bin/bash
set -e


vi Version
./mk-tkg-bundle.sh
./upload-s3.sh tkg-image_$(cat Version).tar.gz
./build.sh
