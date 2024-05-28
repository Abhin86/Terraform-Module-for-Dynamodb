terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Define the AWS provider
provider "aws" {
  region = var.aws_region
}
