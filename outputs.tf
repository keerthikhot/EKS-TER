output "public_subnets" {
  value = module.vpc.public_subnets
  description = "this is public subnet"
}

output "vpcname" {
  value = module.vpc.name
  description = "this is the name of vpc"
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
