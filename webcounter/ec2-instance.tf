resource "aws_instance" "webcounter" {
  count                       = var.instance_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_ids == null ? null : element(var.subnet_ids, count.index)
  vpc_security_group_ids      = [aws_security_group.sg_default_webcounter.id]
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  user_data                   = <<-EOT
              #!/usr/bin/env bash
              mkdir -p /etc/systemd/system/webcounter.service.d/
              cat <<'EOF' > /etc/systemd/system/webcounter.service.d/environment.conf
              [Service]
              Environment='REDIS_ADDR=${var.redis_address}' 'REDIS_PASS=${var.redis_password}'

              EOF
              sudo systemctl daemon-reload
              systemctl restart webcounter.service
              EOT
  lifecycle {
    create_before_destroy = true
  }
}
