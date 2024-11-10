# Provider configuration
provider "aws" {
  region = var.aws_region
}

# Security Group for EC2 instance to allow HTTP and SSH access
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = "vpc-04217544dd097af38"  # Provided VPC ID

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance resource
resource "aws_instance" "app_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.web_sg.name]
  key_name      = "01d1e3ce4368e9e0f"  # Provided Key Pair

  # User data script to install Docker and run the container
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -aG docker ec2-user

              # Pull and run Docker container
              docker run -d -p 80:80 <your-dockerhub-username>/your-app-image
              EOF

  tags = {
    Name = "AppInstance"
  }
}

# Outputs for easy access
output "instance_id" {
  value = aws_instance.app_instance.id
}

output "public_ip" {
  value = aws_instance.app_instance.public_ip
}
