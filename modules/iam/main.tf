resource "aws_iam_user" "admin" {
  name = var.admin_user_name
}

resource "aws_iam_user_policy_attachment" "admin_eks_cluster_admin" {
  user       = aws_iam_user.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_user" "developer" {
  name = var.developer_user_name
}

resource "aws_iam_user_policy_attachment" "developer_eks_cluster_readonly" {
  user       = aws_iam_user.developer.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterReadOnly"
}

#output "iam_role_name" {
#  value = aws_iam_role.eks_cluster.name
#}

resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}
