module "mongodb_sg" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "mongodb"
    sg_description = "Description for mongodb"
    project_name = var.project_name
    environment = var.environment
    #vpc_id = data.aws_ssm_parameter.vpc_id
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    #ingress_rules = var.mongoddb_ingress_rules

    
}

module "catalogue" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "catalogue"
    sg_description = "Description for catalogue"
    project_name = var.project_name
    environment = var.environment
    #vpc_id = data.aws_ssm_parameter.vpc_id
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    #ingress_rules = var.mongoddb_ingress_rules

    
}

module "user" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "user"
    sg_description = "Description for user"
    project_name = var.project_name
    environment = var.environment
    #vpc_id = data.aws_ssm_parameter.vpc_id
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    #ingress_rules = var.mongoddb_ingress_rules

    
}
module "web" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "web"
    sg_description = "Description for web"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    

    
}

module "cart" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "cart"
    sg_description = "Description for cart"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    

    
}
module "shipping" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "shipping"
    sg_description = "Description for shipping"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    

    
}
module "payments" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "payments"
    sg_description = "Description for payments"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    

    
}
module "ratings" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "ratings"
    sg_description = "Description for ratings"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    

    
}
module "redis" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "redis"
    sg_description = "Description for redis"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    

    
}
module "mysql" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "mysql"
    sg_description = "Description for mysql"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    

    
}
module "rabbitmq" {
    source = "../../terraform_aws_securitygroup"
    sg_name = "rabbitmq"
    sg_description = "Description for rabbitmq"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    

    
}
#mongodb accepting connection from catalogue
resource "aws_security_group_rule" "mongodb_sg_catalogue" {
  source_security_group_id = module.catalogue.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb_sg.sg_id
}

#mongodb accepting connection from user
resource "aws_security_group_rule" "mongodb_sg_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb_sg.sg_id
}


resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = module.cart.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
}

resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
}

resource "aws_security_group_rule" "mysql_shipping" {
  source_security_group_id = module.shipping.sg_id
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.mysql.sg_id
}
resource "aws_security_group_rule" "mysql_ratings" {
  source_security_group_id = module.ratings.sg_id
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.mysql.sg_id
}

resource "aws_security_group_rule" "rabbitmq_payments" {
  source_security_group_id = module.payments.sg_id
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  security_group_id = module.rabbitmq.sg_id
}