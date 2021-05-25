# syntax=docker/dockerfile:1
FROM harbor.lab.bekind.io/hub/library/ubuntu:latest AS ubuntu

# Install tools required for project
COPY ./tanzu tanzu
COPY ./setup setup 

# Run `docker build --no-cache .` to update dependencies
RUN setup/setup-packages.sh


CMD ["bash"]
