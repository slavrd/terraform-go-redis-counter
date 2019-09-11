output "redis_private_dns" {
  value = aws_instance.redis_server.private_dns
}

output "redis_private_ip" {
  value = aws_instance.redis_server.private_ip
}

output "redis_public_ip" {
  value = aws_instance.redis_server.public_ip
}

output "redis_public_dns" {
  value = aws_instance.redis_server.public_dns
}