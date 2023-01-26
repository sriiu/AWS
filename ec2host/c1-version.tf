terraform {
  required_version = ">=1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" 
    }
  }
}
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraformstatefiless"
    key    = "dev/terraform.tfstate"
    region = "us-east-1" 
 
    # For State Locking
    dynamodb_table = "terraform_dev"    
  }

provider "aws" {
  region = var.aws_region
  profile = "default"
}

