variable "ami_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
  description = "RHEL ami id"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "type of instance"
}

variable "ec2_tags" {
  type = map
  default = {
    Name = "bhp instance"
    Project = "bhp"
    Environment = "prod"
    Component = "backend"
  }
}

variable "from_port" {
  type = number
  default = 22
}

variable "to_port" {
  type = number
  default = 22
}

variable "protocol" {
  type = string
  default = "tcp"
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    name = "bhp_security_group"
  }
}

variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
  default = "Z02778161V17LIC7EFOQ7"
}

variable "domain" {
  default = "gokasaikiran.online"
}

variable "common_tags" {
  type = map
  default = {
    Name = "sai"
    project = "BHP"
    environment = "prod"
  }
}















































/* /* variable "instance_type" {
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
}  */