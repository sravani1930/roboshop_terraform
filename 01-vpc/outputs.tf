output "azs" {
    value = module.vpc.azs
}
output "vpc_id" {
    value = module.vpc.vpc_id
}

output "default" {
    value = module.vpc.default
}