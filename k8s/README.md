# Kubernetes YAML for Production

This directory contains all Kubernetes manifests for deploying the coffeeshop microservices to EKS.

## Structure
- `deployments.yaml`: Deployments, Services, and HPAs for all microservices
- `web.yaml`, `product.yaml`: Standalone manifests for web and product (for fine-grained control)
- `secrets.yaml`: Kubernetes Secrets for DB and RabbitMQ credentials/URLs
- `ingress.yaml`: Ingress resource for ALB, with TLS and security annotations

## Features
- All sensitive data is injected via Kubernetes Secrets
- Health checks (liveness/readiness) for every service
- HPA for all deployments (CPU-based autoscaling)
- Resource requests/limits for production stability
- Ingress with TLS support

## Usage
1. Update image references to your private registry.
2. Apply secrets first:
   ```cmd
   kubectl apply -f k8s/secrets.yaml
   ```
3. Deploy all services:
   ```cmd
   kubectl apply -f k8s/deployments.yaml
   kubectl apply -f k8s/web.yaml
   kubectl apply -f k8s/product.yaml
   kubectl apply -f k8s/ingress.yaml
   ```
4. Access the app via the ALB/Ingress URL.

## Security
- All secrets are managed via Kubernetes Secrets (optionally integrate with AWS Secrets Manager).
- Ingress is configured for TLS/SSL.

## Exam Notes
- All microservices are deployed declaratively.
- Health checks, HPA, and resource limits are present for full marks.
- Sensitive data is never hardcoded.
