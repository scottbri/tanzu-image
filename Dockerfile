FROM harbor.tanzu.bekind.io/hub/library/photon:latest AS build

## setup the tanzu user to get all the right permissions
RUN tdnf install -y shadow
RUN useradd -m tanzu

## copy over the cli setup and chown it to tanzu
COPY ./tanzu/ /home/tanzu/
COPY ./setup-tanzu-cli /setup-tanzu-cli

ARG INSTALLDIR=/home/tanzu/bin

WORKDIR /setup-tanzu-cli
RUN tar xvf tanzu-cli-bundle-v1.3.1-linux-amd64.tar 
RUN mkdir -p $INSTALLDIR
RUN install cli/core/v1.3.1/tanzu-core-linux_amd64 $INSTALLDIR

WORKDIR $INSTALLDIR
RUN ln -s tanzu-core-linux_amd64 tanzu

WORKDIR /setup-tanzu-cli/cli
RUN gzip -d imgpkg-linux-amd64-v0.5.0+vmware.1.gz -c > $INSTALLDIR/imgpkg
RUN gzip -d kbld-linux-amd64-v0.28.0+vmware.1.gz -c > $INSTALLDIR/kbld
RUN gzip -d ytt-linux-amd64-v0.31.0+vmware.1.gz -c > $INSTALLDIR/ytt
RUN gzip -d kapp-linux-amd64-v0.36.0+vmware.1.gz -c > $INSTALLDIR/kapp
RUN gzip -d vendir-linux-amd64-v0.18.0+vmware.1.gz -c > $INSTALLDIR/vendir

RUN chown -R tanzu /home/tanzu/
RUN chmod +x $INSTALLDIR/*

WORKDIR /setup-tanzu-cli

USER tanzu
RUN $INSTALLDIR/tanzu plugin install --local cli all

###########################################

FROM harbor.tanzu.bekind.io/hub/library/photon:latest as run
RUN tdnf install -y wget vim shadow git tmux

RUN useradd -m tanzu
USER tanzu
COPY --from=build /home/tanzu/ /home/tanzu/

CMD ["bash"]
