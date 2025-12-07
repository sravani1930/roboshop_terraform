module "vpc" {

    #source = "git::https://github.com/sravani1930/terraform-_vpc_module.git?ref=main"
    source = "../../terraform_vpc_module"
    project_name = var.project_name
    environment = var.environment
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr
    is_peering_required = var.is_peering_required

}