#!/bin/bash

BINDIR="${PWD}/tanzu/bin"
TEMPDIR="./temp-installer"

mkdir -p ${BINDIR}
mkdir -p ${TEMPDIR} && cd ${TEMPDIR}

BINARY=ytt-linux-amd64
wget https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.33.0/ytt-linux-amd64
mv $BINARY ${BINDIR}/
chmod +x ${BINDIR}/${BINARY}
ln -s ${BINDIR}/${BINARY} ${BINDIR}/ytt

BINARY=kapp-linux-amd64
wget https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.36.0/kapp-linux-amd64
mv $BINARY ${BINDIR}/
chmod +x ${BINDIR}/${BINARY}
ln -s ${BINDIR}/${BINARY} ${BINDIR}/kapp

BINARY=kbld-linux-amd64
wget https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.30.0/kbld-linux-amd64
mv $BINARY ${BINDIR}/
chmod +x ${BINDIR}/${BINARY}
ln -s ${BINDIR}/${BINARY} ${BINDIR}/kbld

BINARY=vendir-linux-amd64
wget https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.19.0/vendir-linux-amd64
mv $BINARY ${BINDIR}/
chmod +x ${BINDIR}/${BINARY}
ln -s ${BINDIR}/${BINARY} ${BINDIR}/vendir

BINARY=imgpkg-linux-amd64
wget https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.8.0/imgpkg-linux-amd64
mv $BINARY ${BINDIR}/
chmod +x ${BINDIR}/${BINARY}
ln -s ${BINDIR}/${BINARY} ${BINDIR}/imgpkg

BINARY=kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
mv $BINARY ${BINDIR}/
chmod +x ${BINDIR}/${BINARY}

wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
mv jq-linux64 ${BINDIR}/
chmod +x ${BINDIR}/jq-linux64
ln -s ${BINDIR}/jq-linux64 ${BINDIR}/jq

wget https://github.com/direnv/direnv/releases/download/v2.19.2/direnv.linux-amd64
mv direnv.linux-amd64 ${BINDIR}/direnv-linux-amd64
chmod +x ${BINDIR}/direnv-linux-amd64
ln -s ${BINDIR}/direnv-linux-amd64 ${BINDIR}/direnv

#	#wget https://github.com/concourse/concourse/releases/download/v4.2.3/fly_linux_amd64
#	wget https://github.com/concourse/concourse/releases/download/v6.1.0/fly-6.1.0-linux-amd64.tgz
#	mv fly_linux_amd64 ${BINDIR}/fly
#	chmod +x ${BINDIR}/fly
#
#	curl -L https://aka.ms/InstallAzureCli | bash

BINARY=yq_linux_amd64
wget https://github.com/mikefarah/yq/releases/download/v4.9.3/yq_linux_amd64
mv $BINARY ${BINDIR}/
chmod +x ${BINDIR}/${BINARY}
rm ${BINDIR}/${BINARY} ln -s ${BINDIR}/${BINARY} ${BINDIR}/yq

BINARY=helm
wget https://get.helm.sh/helm-v3.5.4-linux-amd64.tar.gz
tar zxvf helm*.gz
mv linux-amd64/helm ${BINDIR}/
chmod +x ${BINDIR}/${BINARY}


exit 0
