IMAGE=${1:-harbor.tanzu.bekind.io/demoapps/tanzu-shell:latest}

#docker run -it --mount type=bind,src=/Users/jbrightwell/code,dst=/code ${IMAGE} /bin/bash
docker run -it ${IMAGE} /bin/bash
