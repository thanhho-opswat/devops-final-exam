variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "ec2_name" {
  description = "EC2 instance name"
  type        = string
  default     = "coffeeshop-dev"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# Optionally add variables for user_data and IAM instance profile
# variable "user_data" {
#   description = "User data script path"
#   type        = string
# }
# variable "iam_instance_profile_name" {
#   description = "IAM instance profile name"
#   type        = string
# }
