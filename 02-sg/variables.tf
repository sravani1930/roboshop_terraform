variable "sg_name" {
    default = "mongodb"
}
# variable "vpc_id" {
#     default = "data.aws_ssm_parameter.vpc_id"

    
# }
variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}


variable "mongoddb_ingress_rules" {
    type = list
    default = [
    {

        description    = "Allow port 80"
        from_port      = "80"
        to_port        = "80"
        protocol       = "tcp"
        cidr_blocks    = ["0.0.0.0/0"]
    },

    {

        description    = "Allow port 443"
        from_port      = "443"
        to_port        = "443"
        protocol       = "tcp"
        cidr_blocks    = ["0.0.0.0/0"]
    }

 ]
}