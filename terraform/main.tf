provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0e86e20dae9224db8" # Ubuntu 24.04 AMI ID for us-east-1
  instance_type = "t2.micro"

  key_name = "eks-terraform-key"

  tags = {
    Name = "AnsibleWebServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y ansible
              EOF
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

