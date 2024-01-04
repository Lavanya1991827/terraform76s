data "aws_ami" "centos8" {
    owners           = ["973714476881"]  #copy from aws 'centos8' ami
  most_recent      = true
  
  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]   #copy from aws 'centos8' ami 
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
 }

 data "aws_ami" "aws-linux-2"{
    owners = ["amazon"]  # or we can give owner id also owners = ["137112412989"]
    most_recent      = true

    filter {
        name   = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-*"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_vpc" "default" {
  default = true
}