#!/bin/bash

echo "Start K8s & MySQL";

sleep 5

minikube start

echo "* Done! *"
sleep 5

echo "* Starting PHPmyAdmin *"
sleep 5

kubectl port-forward --namespace default svc/phpmyadmin-service 8080:80
