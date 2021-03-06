
FROM harbor.tanzu.bekind.io/hub/library/photon:latest

## setup the tanzu user to get all the right permissions
RUN tdnf install -y wget vim shadow git tmux docker-cli bindutils
RUN useradd -m tanzu
USER tanzu

## extract tanzu cli bundle from bucket
WORKDIR /home/tanzu
RUN wget -O - https://public-personal-file-store.s3.amazonaws.com/tkg-image.tar.gz | tar zxvf -
RUN echo "source bashrc.sh >> .bashrc"

CMD ["bash"]
