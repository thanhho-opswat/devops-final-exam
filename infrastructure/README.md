# Infrastructure as Code for AWS (Terraform)

This directory contains all Terraform code to provision AWS infrastructure for the coffeeshop project.

## Structure
- **modules/vpc**: Custom VPC, subnets, and security groups
- **modules/ec2**: EC2 instance for dev environment
- **modules/rds**: PostgreSQL RDS instance
- **modules/eks**: EKS cluster for production

## Features
- No public modules for VPC/SG (custom code)
- Remote S3 backend for state
- Separate workspaces for dev/prod
- Outputs for all key resources (VPC, subnets, SGs, EC2, RDS, EKS)
- Example usage of AWS Secrets Manager for sensitive data

## Usage
1. Edit `variables.tf` and create `dev.tfvars`/`prod.tfvars` for your environment.
2. Initialize and select workspace:
   ```cmd
   terraform init
   terraform workspace new dev
   terraform apply -var-file=dev.tfvars
   terraform workspace new prod
   terraform apply -var-file=prod.tfvars
   ```
3. State is stored in S3 as configured in `backend.tf`.

## Security
- All sensitive data (DB passwords, etc.) should be managed via AWS Secrets Manager and not hardcoded.
- Security groups restrict access to only required ports.

## Exam Notes
- All infrastructure is reproducible and parameterized.
- No public modules for VPC/SG.
- Remote backend and workspaces are required for full marks.
