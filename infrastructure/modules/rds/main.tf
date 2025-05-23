# RDS Module
resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "14.11"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.db_user
  password             = var.db_password
  db_subnet_group_name = var.db_subnet_group
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot  = true
  publicly_accessible  = false
}

output "endpoint" {
  value = aws_db_instance.postgres.endpoint
}
