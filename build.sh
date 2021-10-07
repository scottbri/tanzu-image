VERSION="`cat Version`"

docker build --no-cache -t harbor.tanzu.bekind.io/demoapps/tkg-shell:latest -t harbor.tanzu.bekind.io/demoapps/tkg-shell:${VERSION} .

docker push harbor.tanzu.bekind.io/demoapps/tkg-shell:${VERSION} 
docker push harbor.tanzu.bekind.io/demoapps/tkg-shell:latest
