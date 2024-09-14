#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 4 ]; then
  echo "Usage: $0 CLUSTER_NAME VPC_ID IMAGE_TAG REGION"
  exit 1
fi

CLUSTER_NAME=$1
VPC_ID=$2
IMAGE_TAG=$3
REGION=$4

# Create service account and annotate it with the IAM role ARN
kubectl create serviceaccount alb-ingress-controller -n kube-system || true
kubectl annotate serviceaccount alb-ingress-controller -n kube-system eks.amazonaws.com/role-arn=arn:aws:iam::631327475467:role/ALBIngressIAMRole || true

echo "Deploying Helm chart with Cluster Name: $CLUSTER_NAME, VPC ID: $VPC_ID, Image Tag: $IMAGE_TAG, and Region: $REGION"


helm repo add eks https://aws.github.io/eks-charts
helm repo update


helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
  --set image.tag=$IMAGE_TAG \
  --set clusterName=$CLUSTER_NAME \
  --set serviceAccount.create=false \
  --set serviceAccount.name=alb-ingress-controller \
  --set region=$REGION \
  --set vpcId=$VPC_ID \
  --namespace kube-system
