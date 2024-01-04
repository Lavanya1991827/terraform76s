 resource "aws_instance" "web" {
    ami           = "ami-03265a0778a880afb"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.roboshop-all.id] # it will call variable 'roboshop-all' for security group variable value.

    tags = {
        Name = "HelloTerraform"
    }
}

# security group variable code

resource "aws_security_group" "roboshop-all" {  #this name is for terraform name, for terraform reference only 
    name        = var.sg-name      # this name for AWS
    description = var.sg-description
    
        ingress {
        description      = "Allow all ports"
        from_port        = var.inbound-from-port
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = var.cidr_blocks
        # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]  #commented IPV6 because we are using IPV4.
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    #  ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "roboshop-all-aws"
    }

  }  