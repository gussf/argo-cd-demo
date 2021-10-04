# Getting started ArgoCD in a pipeline
<br/>

# Table of Contents
1. [Setting up](#setting-up)
2. [Running locally](#running-locally)
3. [Pipeline](#pipeline)


<br><br>

# Setting up

## Prerequisites (CLI)
* kind
* kubectl
* argocd

<br>

## Cluster
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

<br>
<hr>

<br><br>


# Running locally

```shell
argocd app sync gus-demo

kubectl get pods

kubectl port-forward <pod> 9000

curl localhost:9000
```
<br>
<hr>

<br><br>

# Pipeline

### To Do
* ~~build~~
* ~~publish docker image~~
* implement kustomize to use newest image in deployment.yaml