
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
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

data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "t3_micro_vm" {
  ami                         = "ami-0f58b397bc5c1f2e8"
  instance_type               = "t3.micro"
  key_name                    = "my-ec2-key"
  vpc_security_group_ids       = [aws_security_group.allow_ssh.id]
  associate_public_ip_address  = true


  user_data = <<-EOF
              #!/bin/bash
              # Update system packages
              sudo apt update -y
              # Install Git and Tree
              sudo apt-get install -y git wget tree
              EOF


  tags = {
    Name = var.instance_name
  }
}
