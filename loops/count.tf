resource "aws_instance" "web" {
 #count = 11 # count.index is a special variable given by terraform
count = length(var.instance_names)
 ami = var.ami_id

 instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql"   || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"

 tags = {
    Name = var.instance_names[count.index]
 }
}

resource "aws_route53_record" "www" {
 #count = 11
  count = length(var.instance_names)
  zone_id = var.zone_id
  #name    = "${var.instance_names[count.index]}.${var.domian_name}" #interpolation
  name    = var.instance_names[count.index] == "web" ? "" : "${var.instance_names[count.index]}.${var.domian_name}" #interpolation  , #for web instance no record name needed in hosted zone records
  type    = "A"
  ttl     = 300
  records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
}