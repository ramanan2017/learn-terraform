data "aws_ami_ids" "ami" {
  name_regex       = "Centos-*"
  owners           = ["973714476881"]
}

output "ami" {
  value = data.aws_ami_ids.ami
}

resource "aws_instance" "instance" {
  ami                    = data.aws_ami_ids.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = ["sg-0091ad00710b5ec85"]

}