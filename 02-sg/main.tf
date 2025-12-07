module "mongodb" {
    source = "../../terraform_aws_securitygroup"
    sg_name = var.sg_name
    project_name = var.project_name
    environment = var.environment
    #vpc_id = data.aws_ssm_parameter.vpc_id
    vpc_id = data.aws_ssm_parameter.vpc_id


}