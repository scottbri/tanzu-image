VERSION="`cat Version`"
IMAGE=tkg #or tce

docker build --no-cache --build-arg VERSION=${VERSION} -t harbor.tanzu.bekind.io/demoapps/${IMAGE}-shell:latest -t harbor.tanzu.bekind.io/demoapps/${IMAGE}-shell:${VERSION} .

docker push harbor.tanzu.bekind.io/demoapps/${IMAGE}-shell:${VERSION} 
docker push harbor.tanzu.bekind.io/demoapps/${IMAGE}-shell:latest
