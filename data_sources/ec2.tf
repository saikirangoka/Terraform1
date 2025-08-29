resource "aws_instance" "bhp_instance" {
    ami = data.aws_ami.bhpami.id
    instance_type = "t3.micro"

    tags = {
        Name = "bhp instance"
        Environment = "development"
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