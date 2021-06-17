FROM harbor.tanzu.bekind.io/hub/library/ubuntu:latest AS build

COPY ./setup-tanzu-cli /setup-tanzu-cli
RUN /setup-tanzu-cli/setup-tanzu-cli.sh

FROM harbor.tanzu.bekind.io/hub/library/ubuntu:latest as run
RUN apt-get update && apt-get install wget curl git vim -y && apt-get clean
RUN useradd -m tanzu

COPY --from=build /root/ /home/tanzu/
COPY ./tanzu/ /home/tanzu/

RUN chown -R tanzu:tanzu /home/tanzu

USER tanzu

CMD ["bash"]
