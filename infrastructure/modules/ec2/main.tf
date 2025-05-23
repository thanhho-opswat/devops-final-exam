# EC2 Module
resource "aws_instance" "dev" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name      = var.key_name
  # Optionally add user_data, IAM role, and tags as in the reference
  # user_data = file("${path.module}/prepare_ec2.sh")
  # iam_instance_profile = var.iam_instance_profile_name
  tags = {
    Name = var.ec2_name
    Terraform   = "true"
    Environment = var.environment
  }
}

output "public_ip" {
  value = aws_instance.dev.public_ip
}
