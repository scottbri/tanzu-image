FILENAME="${1:-your-gzipped-tarfile}"
BUCKET=public-personal-file-store

if [ -f $FILENAME ]; then
	echo "Uploading $FILENAME to s3://$BUCKET/tkg-image.tar.gz"
	aws s3 cp $FILENAME s3://$BUCKET/tkg-image.tar.gz

	echo ""; echo Uploading $FILENAME to s3://$BUCKET/$FILENAME
	aws s3 cp $FILENAME s3://$BUCKET/$FILENAME
fi

echo ""; echo "WARNING: Making the object https://$BUCKET.s3.amazonaws.com/tkg-image.tar.gz publically readable"
aws s3api put-object-acl --bucket $BUCKET --key tkg-image.tar.gz --acl public-read

echo ""; echo "WARNING: Making the object https://$BUCKET.s3.amazonaws.com/$FILENAME publically readable"
aws s3api put-object-acl --bucket $BUCKET --key $FILENAME --acl public-read
