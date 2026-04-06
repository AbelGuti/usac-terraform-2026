terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend configuration is passed via -backend-config in CI/CD
  # Example: terraform init -backend-config="bucket=my-bucket" -backend-config="region=us-east-1"
  backend "s3" {
    key = "usac-terraform-2026/terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "usac-terraform-2026"
      ManagedBy   = "terraform"
      Environment = var.environment
    }
  }
}
