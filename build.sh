VERSION="`cat Version`"

docker build -t harbor.tanzu.bekind.io/demoapps/tanzu-shell:latest -t harbor.tanzu.bekind.io/demoapps/tanzu-shell:${VERSION} .

