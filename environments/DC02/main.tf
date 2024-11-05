terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "ahg_keyspaces" {     
  source                           = "../../modules/aws_keyspaces"
  region = var.region
  project = var.project
  project_owner = var.project_owner
  datacenter = var.datacenter
  keyspaces_vpc_id = var.keyspaces_vpc_id
  keyspaces_subnet_id = var.keyspaces_subnet_id
  keyspaces_backup_on = var.keyspaces_backup_on
  keyspaces_vpc_cidr = var.keyspaces_vpc_cidr
  keyspaces_iam_user_wr_name = var.keyspaces_iam_user_wr_name
}