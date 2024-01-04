 resource "aws_instance" "web" {
    ami           = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.roboshop-all.id] # it will call variable 'roboshop-all' for security group variable value.

    tags = var.tags
}