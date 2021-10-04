# Getting started ArgoCD in a pipeline
<br/>

# Table of Contents
1. [Setting up](#setting-up)
2. [Pipeline](#pipeline)


<br><br>

# Setting up

## Prerequisites (CLI)
* kind
* kubectl
* argocd

<br>

## Step by step
```shell
kind create cluster --name argo-cd-demo

kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml

argocd app create gus-demo --repo https://github.com/gussf/argo-cd-demo.git --path k8s --dest-server https://kubernetes.default.svc --dest-namespace default
```

<br>

## GUI credentials
```shell
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

kubectl port-forward svc/argocd-server -n argocd 8080:443

# login at localhost:8080 as admin/<password>
``` 
<br><br>

# Pipeline

### To Do
* build
* publish docker image
* change image version on deployment.yaml