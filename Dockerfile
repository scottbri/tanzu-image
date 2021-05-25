# syntax=docker/dockerfile:1
FROM harbor.lab.bekind.io/hub/library/ubuntu:latest AS ubuntu

# Install tools required for project
COPY ./tanzu/ root/
COPY ./setup setup 

# Run `docker build --no-cache .` to update dependencies
RUN setup/setup-environment.sh
RUN setup/setup-packages.sh


CMD ["bash"]
