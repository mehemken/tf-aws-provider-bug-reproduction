resource "aws_security_group" "allow_wireguard" {
  name        = "allow_wireguard"
  description = "Allow my own wireguard traffic."
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "wg_in" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["${var.my_ip}/32"]
  security_group_id = aws_security_group.allow_wireguard.id
}
