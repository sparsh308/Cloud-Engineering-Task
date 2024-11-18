# Prometheus Monitoring

This directory provides instructions to set up Prometheus using Helm.

---

## Steps to Install Prometheus

1. **Add the Prometheus Helm Chart Repository**
   ```bash
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
Install Prometheus

bash
Copy code
helm install prometheus prometheus-community/prometheus
Access Prometheus

Forward the Prometheus server port to your local machine:

bash
Copy code
kubectl port-forward <prometheus-pod-name> 9090
Access Prometheus at http://localhost:9090.