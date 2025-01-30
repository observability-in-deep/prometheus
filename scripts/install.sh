#!/bin/bash

if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "This script is intended to run on Linux. Please visit the following URL to install on your OS:"
    exit 1
fi

if ! [ -x "$(command -v kubectl)" ]; then
    echo "kubectl is not installed. Please install kubectl first."
    exit 1
fi

if ! [ -x "$(command -v kind)" ]; then
    echo "kind is not installed. Please install kind first."
    exit 1
fi

if ! [ -x "$(command -v helm)" ]; then
    echo "helm is not installed. Please install helm first."
    exit 1
fi
kind delete cluster
kind create cluster --config ./kind.yaml 
kubectl cluster-info --context kind-kind
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update


helm upgrade --install prometheus prometheus-community/kube-prometheus-stack --values ./helm/prometheus-values.yaml



kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml


kubectl rollout status -w deployment/ingress-nginx-controller -n ingress-nginx --timeout=5m

kubectl create ns shenlong

kubectl apply -f ./k8s/values.yaml
