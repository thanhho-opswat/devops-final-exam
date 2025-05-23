variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "subnets" {
  description = "Subnets for EKS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
