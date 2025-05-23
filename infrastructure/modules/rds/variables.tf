variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database user"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "db_subnet_group" {
  description = "DB subnet group"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}
