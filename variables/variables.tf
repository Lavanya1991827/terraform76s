variable "ami_id" {
default =  "ami-03265a0778a880afb"
}

variable "instance_type" {
    type= string
    default = "t2.micro"
}

variable "sg-name" {
      type = string
      default = "roboshop-all"
}

variable "sg-description" {
     type = string
     default = "allowing all ports"
}

variable "inbound-from-port" {
      type = number
      default = 0
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]

}

variable "tags" {
  type = map
  default = {
    Name = "Hello Terraform"
    Project = "Roboshop"
    Environment = "DEV"
    Component = "Web"
    Terraform = "true"
  }
}