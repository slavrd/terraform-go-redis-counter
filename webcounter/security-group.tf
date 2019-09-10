resource "aws_security_group" "sg_default_webcounter" {
  name        = "webcounter-${timestamp()}"
  description = "webcounter default access"
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [name]
  }
}

resource "aws_security_group_rule" "webcounter-in" {
  type              = "ingress"
  from_port         = 8000
  to_port           = 8000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_default_webcounter.id
  description       = "Allow incoming traffic for webcounter"
}

resource "aws_security_group_rule" "webcounter-in-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_default_webcounter.id
  description       = "Allow incoming ssh traffic"
}

resource "aws_security_group_rule" "webcounter-out" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_default_webcounter.id
  description       = "Allow outgoing traffic"
}
