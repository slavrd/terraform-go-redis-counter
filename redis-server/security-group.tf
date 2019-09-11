resource "aws_security_group" "sg_default_redis" {
  name        = "webcounter-redis-${formatdate("YYYYMMDDHHmmss", timestamp())}"
  description = "redis server default access"
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [name]
  }
}

resource "aws_security_group_rule" "redis-in" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_default_redis.id
  description       = "Allow incoming traffic for redis"
}

resource "aws_security_group_rule" "redis-in-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_default_redis.id
  description       = "Allow incoming traffic for redis"
}

resource "aws_security_group_rule" "redis-out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_default_redis.id
  description       = "Allow outgoing traffic"
}