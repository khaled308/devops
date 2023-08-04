terraform {
    backend "s3" {
        bucket = "khaled-terraform-state"
        key = "04/terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
  region = "us-east-1"
}