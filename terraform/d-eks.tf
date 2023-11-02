resource "aws_eks_cluster" "devops" {
  name     = "devops"
  role_arn = aws_iam_role.<EKS_Role>.arn     // We need IAM role with EKS Cluster Policy

  vpc_config {
    subnet_ids = [
      aws_subnet.private-ap-south-1a.id,
      aws_subnet.private-ap-south-1b.id,
      aws_subnet.public-ap-south-1a.id,
      aws_subnet.public-ap-south-1b.id
    ]
  }
}

resource "aws_eks_node_group" "devops-node-group-1" {
  cluster_name    = aws_eks_cluster.devops.name
  node_group_name = "devops-node-group-1"
  node_role_arn   = aws_iam_role.<Nodes_Role>.arn     // Role with CNI and ECR policies

  subnet_ids = [
    aws_subnet.private-ap-south-1a.id,
    aws_subnet.private-ap-south-1b.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["c5.xlarge"]

  scaling_config {
    desired_size = 2
    max_size     = 50
    min_size     = 2
  }
