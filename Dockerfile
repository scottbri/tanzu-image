FROM harbor.tanzu.bekind.io/hub/library/photon:latest AS build

COPY ./setup-tanzu-cli /setup-tanzu-cli
RUN /setup-tanzu-cli/setup-tanzu-cli.sh

FROM harbor.tanzu.bekind.io/hub/library/photon:latest as run
RUN yum install wget curl git vim -y 

RUN useradd -m tanzu

COPY --from=build /root/ /home/tanzu/
COPY ./tanzu/ /home/tanzu/

RUN chown -R tanzu:tanzu /home/tanzu
USER tanzu
CMD ["bash"]
