terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tc-oficina-terraform-state"
    key    = "infra-db/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "tc" {
  filter {
    name   = "tag:Name"
    values = ["tc-oficina-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.tc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["tc-oficina-subnet-private-*"]
  }
}
