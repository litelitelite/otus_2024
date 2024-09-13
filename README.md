# lession-30-kubernetes

## This code contain manifests to deploy simple web app for managed k8s in YC, or into a local minikube (whatever).

## For demo uses `yeasy/simple-web:latest` docker image.

### Usage

Run this command:

- `kubectl apply -f ./manifests/*`

### Destroy env

- `kubectl delete -f ./manifests/*`

### Requirements

`managed k8s in YC, or local minikube installation with NGINX-ingress controller`
