variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "instance_type" {
  default = "t3.small"
}

variable "security_group" {
  default = ["sg-0091ad00710b5ec85"]
}

variable "zone_id" {
  default = "Z02461421H4DZFKN2OZ9Y"
}

variable "components" {
  default = {
    frontend  = { name = "frontend-dev" }
    catalogue = { name = "catalogue-dev" }
    mongodb   = { name = "mongodb-dev" }
    user      = { name = "user-dev" }
    redis     = { name = "redis-dev" }
    cart      = { name = "cart-dev" }
    mysql     = { name = "mysql-dev" }
    shipping  = { name = "shipping-dev" }
    payment   = { name = "payment-dev" }
    rabbitmq  = { name = "rabbitmq-dev" }
  }
}

resource "aws_instance" "instance" {
  for_each               = var.components
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group

  tags = {
    Name = lookup(each.value, "name", null)
  }
}

resource "aws_route53_record" "record" {
  for_each = var.components
  name     = "${lookup(each.value, "name", null)}.ramdevops.co.uk"
  type     = "A"
  ttl      = 30
  zone_id  = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null)]
}