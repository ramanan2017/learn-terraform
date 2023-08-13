variable "security_group" {
  default = ["sg-0091ad00710b5ec85"]
}

variable "zone_id" {
  default = "Z02461421H4DZFKN2OZ9Y"
}

variable "components" {
  default = {
    frontend = {
      name          = "frontend"
      instance_type = "t3.micro"
    }
    cart = {
      name          = "cart"
      instance_type = "t3.micro"
    }
  }
}