variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}
variable "common_tags" {
    type = map 
    default = {
        project = "roboshop"
        Environment = "terraform"
    }
}