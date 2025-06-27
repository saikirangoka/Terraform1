resource "aws_instance" "My_ins" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow.id]
}

resource "aws_security_group" "allow" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  ingress {
    from_port   =   22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   =   0
    to_port     =   0
    protocol    =   "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    Name = "First_security_Group"
  }
}