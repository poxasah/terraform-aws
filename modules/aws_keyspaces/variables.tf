variable "region" {
  description = "AWS Region"
}

variable "project" {
  description = "Name of the project"
}

variable "project_owner" {
  description = "Owner of Project"
}

variable "datacenter" {
  description = "The name of datacenter"
}

##################
# Vars Keyspaces sabrina-keyspaces-demo
#####

variable "keyspaces_backup_on" {
  description = "Backup point in time ENABLED"
  default = "ENABLED"
}

variable "keyspaces_backup_off" {
  description = "Backup point in time DISABLED"
  default = "DISABLED"
}

##################
# Vars IAM
#####
variable "keyspaces_iam_user_wr_name" {
  description = "IAM Name Existing user to associate permissions with"
}

data "aws_caller_identity" "current" {}

##################
# Vars VPC
#####
variable "keyspaces_vpc_id" {
  description = "Type of VPC endpoint Ex: Interface or Gateway"
}

variable "keyspaces_vpc_cidr" {
  description = "CIDR of VPC"
}

variable "keyspaces_subnet_id" {
  description = "Type of VPC endpoint Ex: Interface or Gateway"
}