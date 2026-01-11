module "vote_service_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = local.sgname
  description = "Security group for Kubernetes services (internal VPC access)"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "HTTPS from VPC"
      cidr_blocks = local.cidr
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP from VPC"
      cidr_blocks = local.cidr
    }
  ]

  egress_rules = ["all-all"]

  tags = {
    Name      = local.sgname
    Terraform = "true"
  }
}
