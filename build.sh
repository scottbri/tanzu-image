VERSION="`cat Version`"

docker build -t harbor.lab.bekind.io/tanzu-image/tanzu-image:latest -t harbor.lab.bekind.io/tanzu-image/tanzu-image:${VERSION} .

