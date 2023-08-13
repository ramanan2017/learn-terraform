resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group

  tags = {
    Name = var.name
  }
}

resource "aws_route53_record" "record" {
  name     = "${var.name}-dev.ramdevops.co.uk"
  type     = "A"
  ttl      = 30
  zone_id  = [aws_instance.instance.private_ip]
}


