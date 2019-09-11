resource "aws_instance" "webcounter" {
  count                       = var.instance_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.sg_default_webcounter.id]
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  depends_on = [
    aws_security_group.sg_default_webcounter
  ]
}

resource "null_resource" "provision" {

  count = var.instance_count

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = aws_instance.webcounter[count.index].public_dns
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    content     = <<-EOF
                  [Service]
                  Environment='REDIS_ADDR=${var.redis_address}' 'REDIS_PASS=${var.redis_password}'
                  EOF
    destination = "/tmp/environment.conf"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /etc/systemd/system/webcounter.service.d/",
      "sudo cp /tmp/environment.conf /etc/systemd/system/webcounter.service.d/.",
      "sudo systemctl daemon-reload",
      "sudo systemctl restart webcounter.service",
      "rm /tmp/environment.conf",
    ]
  }

  triggers = {
    redis_addr = var.redis_address
    redis_pass = var.redis_password
  }
}
