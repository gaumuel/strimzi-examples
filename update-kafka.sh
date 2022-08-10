#!/bin/sh

echo "Update kafka..."

# kubectl --namespace kafka edit kafka my-cluster 
kubectl apply -f https://raw.githubusercontent.com/gaumuel/strimzi-examples/main/kafka-update-31-32.yaml -n kafka
kubectl get pods my-cluster-kafka-0 -o jsonpath='{.spec.containers[0].image}'
kubectl wait kafka/my-cluster --for=condition=Ready --timeout=900s -n kafka
kubectl apply -f https://raw.githubusercontent.com/gaumuel/strimzi-examples/main/kafka-persistent-32.yaml -n kafka
