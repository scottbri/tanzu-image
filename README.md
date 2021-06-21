jj# tanzu-image
 Build a Tanzu CLI container for managing VMware Tanzu kubernetes clusters

## CAUTION
The very nature of what this built container image represents could be considered highly insecure.  Basically the goal is to provide kubernetes cluster level command and control tools from within a container.  That's great for isolating your local machine and not polluting it with a bunch of tools.  That's a highly questionable activity if you run this container as a POD on a multi-user K8s cluster.  Potentially you will expose your KUBECONFIG credentials, the tools, scripts, and sysadmin level activities to anyone with access to this running pod.  Use with caution.  You have been warned.  You cannot hold me accountable for your bad security practices.

## Installation
Grab the bits
```bash
git clone https://github.com/scottbri/tanzu-image
cd tanzu-image
```

Go get the Tanzu CLI bundle for Linux from my.vmware.com.  
Tanzu CLI version 1.3.1 is available here...https://my.vmware.com/en/web/vmware/downloads/details?downloadGroup=TKG-131&productId=988&rPId=65946.  
The goal is to place the tar file tanzu-cli-bundle-<YOUR_VERSION>-linux-amd64.tar into the ./setup-tanzu-cli/ folder.  DO NOT extract the tar.  The container build script will do that.
```bash
cp ~/Downloads/tanzu-cli-bundle-<YOUR_VERSION>-linux-amd64.tar/ ./setup-tanzu-cli/
```

Edit your container registry entries and image tags to pull / push to your target registry
```bash
vi Dockerfile   # from where to pull photon
vi build.sh     # edit the image registry tags
```

Run the build script and view the newly built image
```bash
./build.sh      # build the container image
docker images   # view the built images
```

Edit the image registry tags in the script to reference your new image
```bash
vi drun.sh      # edit the image registry tags
```

Run the container locally with a bash shell
```bash
./drun.sh       # get a bash shell with tanzu and carvel CLI
```

Push your container to an external image registry
```bash
docker push <your_new_container_image_tag>
```

Kubernetes deployment manifest examples are provided in the manifests folder.  Use either the deployment or the pod manifest (not both).  Edit your kubernetes manifest(s) to reference the new registry / namespace / etc.
```bash
vi manifests/tanzu-image-deployment.yaml    # edit image tags
vi manifests/tanzu-image-pod.yaml           # edit image tags
```

Edit the image registry tags in the kubernetes run script to reference your new image
```bash
vi krun.sh      # edit image tags
```

Set your kubectl context to be the K8s cluster you want to manage.  You can see how the krun.sh script copies your KUBECONFIG file into the container.  This is not secure, as anyone with access to the pod can run bash and have access to your KUBECONFIG.  
Run the container remotely with a bash shell for fun and profit
```bash
./krun.sh   # get a remote tanzu CLI shell
```