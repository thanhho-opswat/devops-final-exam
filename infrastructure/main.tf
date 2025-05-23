terraform {
  backend "s3" {
    bucket = "thanhho-coffeeshop-prod-bucket"
    key    = "coffeeshop/terraform.tfstate"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  # ...variables...
}

module "ec2" {
  source = "./modules/ec2"
  # ...variables...
}

module "rds" {
  source = "./modules/rds"
  # ...variables...
}

module "eks" {
  source = "./modules/eks"
  # ...variables...
}
