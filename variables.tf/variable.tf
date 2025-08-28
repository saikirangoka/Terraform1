variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "cidr_blocks" {
    type = list(string)
    default = [("0.0.0.0/0")]
}

variable "ingress_protocol" {
    default = "tcp"
}

variable "egress_protocol" {
  default = "-1"
}

variable "ec2_tags" {
  default = {
    project = "Expense"
    Component = "Backend"
    Environment = "Dev"
    Name = "expense-backend-dev"
  }
}

variable "security_group_tags" {
  default = {
    Name = "My_Security_Group"
  }
}