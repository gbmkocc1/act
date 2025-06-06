data "aws_caller_identity" "current" {}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "secure-cluster"
  cluster_version = "1.29"

  vpc_id = module.vpc.vpc_id

  enable_cluster_creator_admin_permissions = true

  # ✅ Corrected to map format, not list/tuple
access_entries = {
  github_user = {
    principal_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/github-terraform-user"
    kubernetes_groups = ["eks-admins"]
    type              = "STANDARD"
  }
}

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_size   = 1
      subnet_ids     = module.vpc.private_subnets # ✅ This is how you pass subnet_ids now
    }
  }

  # ✅ Required to set control plane subnet IDs (even though public/private distinction is handled inside module)
  control_plane_subnet_ids = module.vpc.private_subnets
}
