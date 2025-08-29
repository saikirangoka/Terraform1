resource "aws_instance" "bhp_instance" {
    ami = local.ami_id
    instance_type = local.instance_type

    tags = {
        Name = local.name
        Environment = local.Environment
    }
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "This is the ec2 created in terraform"

    tags = {
        name = "first security group"
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}