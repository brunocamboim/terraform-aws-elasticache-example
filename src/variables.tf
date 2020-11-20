provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = "~> 3.0"
  }

  backend "s3" {
    encrypt = true
    bucket  = "terraform-remotestate-dev"
    region  = "us-east-1"
    key     = "elasticache-state"
  }
}

variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "dev"
}

variable "elasticache_node_type" {
  default = "cache.t2.micro"
}

variable "vpc_cidr_block" {
  default = "10.110.0.0/16"
}