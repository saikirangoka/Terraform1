resource "aws_instance" "bhp_instance" {
  count = 3
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = merge(
    var.common_tags,
    {
    Name = var.instances[count.index]
    }
  )
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "This is second ec2 instance created in terraform"

  tags = var.sg_tags

  ingress {
    from_port = var.from_port
    to_port = var.to_port
    protocol = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route53_record" "bhp_instance" {
  count = 3
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.bhp_instance[count.index].private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "bhp_instance1" {
  zone_id = var.zone_id
  name = var.domain
  type = "A"
  ttl = 1
  records = [aws_instance.bhp_instance[2].public_ip]
  allow_overwrite = true
}