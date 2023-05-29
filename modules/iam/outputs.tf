output "iam_role_name" {
  description = "The name of the IAM role for the EKS cluster."
  value = aws_iam_role.eks_cluster.name
}
