variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default= "dev"
}

variable "public_subnet_cidr" {
    type = list 
    default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
    
  ]

}

variable "private_subnet_cidr" {
    type = list 
    default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
    
  ]

}

variable "database_subnet_cidr" {
    type = list 
    default = [
    "10.0.21.0/24",
    "10.0.22.0/24"
    
  ]

}

variable "nat_gateway_tags" {
    type = map 
    default = {}
}

variable "is_peering_required" {
    type = bool
    default = false
}
