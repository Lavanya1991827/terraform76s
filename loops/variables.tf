variable "ami_id" {
  type = string
  default = "ami-03265a0778a880afb"
}

variable "instance_names" {
  type = list
  default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","dispatch","web"]
}

variable "zone_id" {
    default ="Z07739021TY5XLGO2FQAS"  #copy it from aws ->route53->hostenzone->id"
}

variable domian_name {
    default = "nihatech.online"
}