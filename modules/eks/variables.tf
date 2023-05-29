variable "cluster_name" {
  description = "The name of the EKS cluster."
}

variable "vpc_id" {
  description = "The ID of the VPC."
}

variable "public_subnet_ids" {
  description = "The IDs of the public subnets."
  type = list(string)
}

variable "iam_role_name" {
  description = "The name of the IAM role for the EKS cluster."
}
