module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.vpcname
  cidr = local.cidr

  azs             = local.az
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  intra_subnets   = local.infra_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
}
