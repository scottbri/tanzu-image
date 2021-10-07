#!/bin/bash
TANZUPOD="${1:-tkg-shell}"

kubectl cp $KUBECONFIG ${TANZUPOD}:/home/tanzu/.kube/config
kubectl exec --stdin --tty ${TANZUPOD} -- bash
