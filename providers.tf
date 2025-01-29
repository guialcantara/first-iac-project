terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket  = "benfica-state-bucket-tf"
    region  = "sa-east-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket

  lifecycle {
    prevent_destroy = true
  }
}