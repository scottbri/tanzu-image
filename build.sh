VERSION="`cat Version`"

docker build --no-cache -t harbor.tanzu.bekind.io/demoapps/tanzu-shell:latest -t harbor.tanzu.bekind.io/demoapps/tanzu-shell:${VERSION} .

