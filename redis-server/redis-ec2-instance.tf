resource "aws_instance" "redis_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.sg_default_redis.id]
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  user_data                   = <<-EOT
                                #!/usr/bin/env bash
                                sed -i 's/^\(# \)*requirepass.*$/requirepass ${var.redis_password}/' /etc/redis/redis.conf
                                systemctl restart redis.service
                                EOT
}
