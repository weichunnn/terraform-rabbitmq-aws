terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
  profile = var.profile 
}

resource "aws_instance" "rmq" {
  ami = "ami-02248c9d6ba0b9e12"  
  instance_type = "t2.micro"
  key_name = "devops"
  vpc_security_group_ids = ["sg-0b996912fe602cd67"]

  tags = {
    Name = var.name
    group = var.group
  }
}