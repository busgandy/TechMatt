provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}

module "iam" {
  source = "./modules/iam"
  admin_user_name = var.admin_user_name
  developer_user_name = var.developer_user_name
}

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  iam_role_name = module.iam.iam_role_name
}

#output "kubeconfig" {
#  value = module.eks.kubeconfig
#}
