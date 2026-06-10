terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
     profile = "unir-account"
     region = "us-west-1"
}

resource "aws_instance" "app_server" {
  # AWS image - Apache installed
  ami                           = var.node_ami
  instance_type                 = var.instance_type
  key_name                      = "unir-learn-terraform-nodejs-server"
  subnet_id                     = var.webserver_subnet
  private_ip                    = var.webserver_priv_ip
  vpc_security_group_ids        = var.webserver_sg
  associate_public_ip_address   = true
  tags = {
      Name = "Apache Instance"
      Description = "Build Application Server with Apache installed using Packer and Terraform"
      Subject = "Cloud Computing DevOps y DevOps Culture"
  }

}