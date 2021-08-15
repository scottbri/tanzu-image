FROM harbor.tanzu.bekind.io/hub/library/photon:latest

## setup the tanzu user to get all the right permissions
RUN tdnf install -y  wget vim shadow git tmux
RUN useradd -m tanzu
USER tanzu

## extract tanzu cli bundle from bucket
WORKDIR /home/tanzu
RUN wget -O - https://public-personal-file-store.s3.amazonaws.com/tanzu-cli.tar.gz | tar zxvf -

CMD ["bash"]
