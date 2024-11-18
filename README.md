# Static Web Application Deployment on AWS EKS

## Prerequisites
- AWS CLI installed
- kubectl installed
- Terraform installed
- Docker installed
- Helm installed

## Deployment Steps

AWS Kubernetes Deployment Documentation
This guide explains how to deploy a static web application on AWS Kubernetes (EKS) with Prometheus for monitoring.

Prerequisites
Before starting, ensure you have the following:

AWS account with necessary IAM permissions.
Installed tools:
AWS CLI
Terraform
kubectl
Docker
Helm
Step 1: Provision AWS Infrastructure
Create Terraform Configuration Files

Three files: main.tf, variables.tf, and outputs.tf with the following contents:

Run Terraform Commands

Initialize and apply Terraform:

bash
Copy code
terraform init
terraform apply



tep 2: Build and Push Docker Image
Create a Dockerfile with the following content:

dockerfile
Copy code
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80


Build the Docker image:

bash
Copy code
docker build -t static-app .
Push the Docker image to Amazon ECR: Replace <account-id> and <region> with your AWS account ID and region:

bash
Copy code
aws ecr create-repository --repository-name static-app
docker tag static-app:latest <account-id>.dkr.ecr.<region>.amazonaws.com/static-app:latest
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/static-app:latest



Apply the Kubernetes manifests:

bash
Copy code
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
Get the external IP:

bash
Copy code
kubectl get svc static-app-service


dd Prometheus Helm Chart Repository:

bash
Copy code
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
Install Prometheus:

bash
Copy code
helm install prometheus prometheus-community/prometheus
Access Prometheus: Forward the Prometheus server port to your local machine:

bash
Copy code
kubectl port-forward <prometheus-pod-name> 9090
Visit http://localhost:9090 in your browser.

main.tf
