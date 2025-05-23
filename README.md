# coffeeshop

Cloud-native microservices project for DevOps exam.

## Summary

This project demonstrates a full-stack microservices deployment on AWS using Infrastructure as Code, CI/CD, Kubernetes, and monitoring best practices.

## Table of Contents
- [Architecture](#architecture)
- [Component Description](#component-description)
- [Homepage](#homepage)
- [Healthcheck Settings](#healthcheck-settings)
- [User Guideline](#user-guideline)
- [Step-by-step deployment guide](#step-by-step-deployment-guide)
- [Exam Notes](#exam-notes)

## Architecture

The system consists of multiple microservices (web, proxy, product, counter, barista, kitchen) running on AWS. Infrastructure is provisioned with Terraform (VPC, EC2, RDS, EKS, S3 backend, Secret Manager). Dev environment uses Docker Compose; production uses EKS with Kubernetes YAML. CI/CD is managed by GitHub Actions. Monitoring is via CloudWatch and/or Grafana.

```
[User] -> [ALB/Ingress] -> [Web] -> [Proxy] -> [Product|Counter|Barista|Kitchen] -> [PostgreSQL|RabbitMQ]
```

## Component Description

- **Web**: Frontend UI, connects to Proxy
- **Proxy**: Reverse proxy, routes to Product/Counter
- **Product**: Product service, connects to PostgreSQL and RabbitMQ
- **Counter**: Counter service, connects to Product
- **Barista/Kitchen**: Backend services, connect to PostgreSQL and RabbitMQ
- **PostgreSQL**: RDS database
- **RabbitMQ**: Message broker
- **Infrastructure**: VPC, EC2 (dev), EKS (prod), RDS, Secret Manager
- **CI/CD**: GitHub Actions pipeline
- **Monitoring**: CloudWatch/Grafana dashboards and alerts

## Homepage

After deployment, access the web UI at: `http://thanhho.coffeeshop.com:8888`

## Healthcheck Settings

- Each service exposes `/health` endpoint for liveness/readiness probes
- Kubernetes YAML includes health checks for web and product

## User Guideline

1. **Clone the repo**
2. **Provision AWS infrastructure**
   - `cd infrastructure && terraform init && terraform apply`
3. **Dev environment**
   - `docker-compose up -d`
   - Access at `http://localhost:8888`
4. **Prod environment**
   - Push images to your registry
   - Update image references in `k8s/*.yaml`
   - `kubectl apply -f k8s/`
   - Access via ALB/Ingress
5. **CI/CD**
   - Push to `main` triggers build, scan, push, and deploy
6. **Monitoring**
   - View dashboards in CloudWatch/Grafana

## Step-by-step deployment guide

### 1. Infrastructure Provisioning
- Edit `infrastructure/variables.tf` to set your AWS region and resource parameters.
- Run:
  ```cmd
  cd infrastructure
  terraform init
  terraform workspace new dev
  terraform apply -var-file=dev.tfvars
  terraform workspace new prod
  terraform apply -var-file=prod.tfvars
  ```

### 2. Build & Push Images
- Build and tag Docker images for all services.
- Push to your private registry (ECR, DockerHub, etc.).

### 3. Dev Environment
- Run:
  ```cmd
  docker-compose up -d
  ```
- Access at [http://localhost:8888](http://localhost:8888)

### 4. Production Deployment
- Update image references in `k8s/*.yaml` to your registry.
- Apply secrets and manifests:
  ```cmd
  kubectl apply -f k8s/secrets.yaml
  kubectl apply -f k8s/deployments.yaml
  kubectl apply -f k8s/web.yaml
  kubectl apply -f k8s/product.yaml
  kubectl apply -f k8s/ingress.yaml
  ```
- Access via ALB/Ingress URL.

### 5. Monitoring
- See `monitoring/` for CloudWatch/Grafana setup.

### 6. CI/CD
- Review `.github/workflows/ci-cd.yaml` for pipeline steps.
- Push to `main` to trigger build, scan, push, and deploy.

---

## Exam Notes
- All sensitive data is managed via Kubernetes Secrets and AWS Secrets Manager.
- All services have health checks, resource limits, and HPA.
- Infrastructure is fully reproducible and parameterized.
- Monitoring and alerting are ready for production.
