packer {
  required_plugins {
    # AWS
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }

    # Ansible
    ansible = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

# 1. AWS Builder
source "amazon-ebs" "ubuntu-aws" {
  ami_name              = "packer-ubuntu-22.04-apache"
  force_deregister      = true
  force_delete_snapshot = true

  instance_type = "t3.micro"
  region        = "us-west-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  # Tags for the final AMI
  tags = {
    Name        = "Apache - Ubuntu 22.04"
    Environment = "Unir - AWS"
    Build_By    = "Packer"
    OS          = "Ubuntu 22.04"
  }

  ssh_username = "ubuntu"

  # AWS Profile to use for authentication (defined in ~/.aws/credentials)
  profile = "unir-account"
}

build {
  name    = "install-apache-ubuntu-aws"
  sources = ["source.amazon-ebs.ubuntu-aws"]

  provisioner "ansible" {
    playbook_file = "./provisioning/playbook.yml"
    user          = "ubuntu"
  }

  post-processor "manifest" {
    output = "manifest.json"
  }
}