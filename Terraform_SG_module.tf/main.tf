resource "aws_security_group" "mysql_sg" {
    name = local.sg_name
    description = var.sg_description
    vpc_id = var.vpc_id


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(
        var.common_tags,
        var.sg_tags,
        {
            Name = local.sg_name
        }
    )
}