output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "this is public subnet"
}

output "vpcname" {
  value       = module.vpc.name
  description = "this is the name of vpc"
}