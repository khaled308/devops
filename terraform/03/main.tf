terraform {
    backend "s3"{
        bucket = "khaled-terraform-state"
        key = "03/terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

   filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

output "free_tier_ami_id" {
  value = data.aws_ami.ami.id
}
