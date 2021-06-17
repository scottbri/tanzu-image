VERSION="`cat Version`"

docker build -t harbor.tanzu.bekind.io/demoapps/tanzu-image:latest -t harbor.tanzu.bekind.io/demoapps/tanzu-image:${VERSION} .

