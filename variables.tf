variable "region" {
  description = "The AWS region to deploy resources in."
  default = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "The CIDR blocks for the public subnets."
  default = ["10.0.1.0/", "10.0.2.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "The CIDR blocks for the private subnets."
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "admin_user_name" {
  description = "The name of the admin IAM user."
  default = "admin"
}

variable "developer_user_name" {
  description = "The name of the developer IAM user."
  default = "developer"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  default = "example-cluster"
}
