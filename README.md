# Getting started with setting up ArgoCD

## Prerequisites (CLI)
* kind
* kubectl
* argocd

<br><hr><br>

## Step by step
```shell
kind create cluster --name argo-cd-demo

kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
```

## GUI credentials
```shell
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

kubectl port-forward svc/argocd-server -n argocd 8080:443

# login at localhost:8080 as admin/<password>
``` 
