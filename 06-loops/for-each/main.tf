variable "components" {
  default = {
    catalogue = { name = "catalogue_sg" }
    mongodb   = { name = "mongodb_sg" }
  }
}

resource "aws_security_group" "allow_tls" {
  for_each = var.components
  name     = lookup(var.components, each.value["name"], null)  //lookup(map, key, default)
  //lookup({a="ay", b="bee"}, "a", "what?")  Answer ay


}