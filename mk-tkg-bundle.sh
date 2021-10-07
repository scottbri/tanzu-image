VERSION="$(cat Version)"
IMAGE=tkg

TARFILE=$IMAGE-image_$VERSION.tar.gz
cd image
tar zcvf ../$TARFILE .

