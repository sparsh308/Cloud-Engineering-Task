# AWS Kubernetes Deployment with Prometheus Monitoring

This project demonstrates deploying a static web application on AWS EKS (Elastic Kubernetes Service) with Prometheus for monitoring. The infrastructure is provisioned using Terraform.

---

## Project Structure

- **terraform/**: Contains Terraform scripts to provision AWS infrastructure.
- **kubernetes/**: Contains Kubernetes manifests for the application deployment.
- **prometheus/**: Instructions for setting up Prometheus for monitoring.
- **Dockerfile**: Dockerfile for containerizing the static web application.
- **index.html**: Static content for the web application.

---

## Prerequisites

- AWS account with IAM permissions.
- Installed:
  - [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
  - [Terraform](https://www.terraform.io/downloads)
  - [kubectl](https://kubernetes.io/docs/tasks/tools/)
  - [Docker](https://docs.docker.com/get-docker/)
  - [Helm](https://helm.sh/docs/intro/install/)

---

## Deployment Steps

### Step 1: Provision AWS Infrastructure

Navigate to the `terraform/` directory and follow the instructions in `terraform/README.md` to provision the EKS cluster.

### Step 2: Build and Push Docker Image

Use the provided `Dockerfile` and `index.html` to containerize the web application and push it to Amazon ECR. Follow the instructions in `kubernetes/README.md`.

### Step 3: Deploy to Kubernetes

Deploy the Kubernetes manifests to the EKS cluster. Follow the instructions in `kubernetes/README.md`.

### Step 4: Setup Monitoring with Prometheus

Install Prometheus using Helm. Instructions are in `prometheus/README.md`.

---

## Cleanup

To delete all resources:
1. Navigate to `terraform/` and run:
   ```bash
   terraform destroy
Delete Kubernetes resources:
bash
Copy code
kubectl delete -f kubernetes/deployment.yaml -f kubernetes/service.yaml
helm uninstall prometheus
yaml
Copy code

---

### **2. `terraform/README.md`**

```markdown
# Terraform for AWS EKS Infrastructure

This directory contains Terraform scripts to provision the following resources:
- VPC
- Subnets
- EKS Cluster
- Node Group

---

## Steps to Provision

1. **Initialize Terraform**
   ```bash
   terraform init
Apply Terraform

bash
Copy code
terraform apply
Confirm the apply by typing yes.

Outputs Terraform will output the cluster's kubeconfig file location. Use it to authenticate with the EKS cluster:

bash
Copy code
export KUBECONFIG=<output-kubeconfig-file-path>
