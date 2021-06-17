cd /setup-tanzu-cli
tar xvf tanzu-cli-bundle-v1.3.1-linux-amd64.tar

mkdir /root/bin
install cli/core/v1.3.1/tanzu-core-linux_amd64 /root/bin/
cd /root/bin 
ln -s tanzu-core-linux_amd64 tanzu

ls -al

cd /setup-tanzu-cli
/root/bin/tanzu plugin install --local cli all

cd /setup-tanzu-cli/cli
gzip -d imgpkg-linux-amd64-v0.5.0+vmware.1.gz ; mv imgpkg-linux* /root/bin/imgpkg
gzip -d kbld-linux-amd64-v0.28.0+vmware.1.gz ; mv kbld-linux* /root/bin/kbld
gzip -d ytt-linux-amd64-v0.31.0+vmware.1.gz ; mv ytt-linux* /root/bin/ytt
gzip -d kapp-linux-amd64-v0.36.0+vmware.1.gz ; mv kapp-linux* /root/bin/kapp
gzip -d vendir-linux-amd64-v0.18.0+vmware.1.gz ; mv vendir-linux* /root/bin/vendir
