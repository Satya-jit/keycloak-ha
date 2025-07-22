provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "keycloak_sg" {
  name = "keycloak_sg"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "keycloak" {
  ami                    = "ami-0f918f7e67a3323f0" # Ubuntu 22.04 LTS 
  instance_type          = "t3.medium"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.keycloak_sg.id]
  user_data              = file("ec2-user-data.sh")

  tags = {
    Name = "Keycloak-HA"
  }
}
