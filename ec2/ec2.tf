resource "aws_instance" "bhp_instance" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = {
        Name = "Terraform ec2"
        Purpose = "practice"
    }
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "This the main security group"

    tags = {
        name = "allow_tls"
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