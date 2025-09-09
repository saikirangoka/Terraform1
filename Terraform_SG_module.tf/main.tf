resource "aws_security_group" "mysql_sg" {
    name = ""
    description = ""

    vpc_id = aws_vpc.t
}