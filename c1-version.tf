terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.00"
    }
  

  }

  backend "s3" {
    bucket = "terraformstatefiless"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraformlock"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "default"
}




