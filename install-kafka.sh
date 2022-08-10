#!/bin/sh

kubectl create namespace kafka
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
kubectl apply -f https://raw.githubusercontent.com/gaumuel/strimzi-examples/main/kafka-persistent-31.yaml -n kafka
kubectl wait kafka/my-cluster --for=condition=Ready --timeout=900s -n kafka
