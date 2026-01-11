module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${local.vpcname}-ekscluster"
  cluster_version = "1.31"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  enable_irsa = true

  # 🔐 THIS IS THE FIX
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      name = local.ngname

      min_size     = 1
      max_size     = 1
      desired_size = 1

      instance_types = ["t3.small"]
    }
  }

  tags = {
    Terraform = "true"
  }
}
