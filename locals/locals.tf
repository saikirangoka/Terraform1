locals {
    ami_id = data.aws_ami.bhpami.id
    instance_type = "t3.micro"
    name = "${var.project}-${var.environment}-${var.component}"
    environment = "development"
    component = "backend"
    Environment = "${local.environment}-${local.component}"
}