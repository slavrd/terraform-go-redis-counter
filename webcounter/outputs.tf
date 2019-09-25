output "webcounter_public_dns" {
  value = aws_instance.webcounter[*].public_dns
}

output "webcounter_public_ips" {
  value = aws_instance.webcounter[*].public_ip
}

output "webcounter_service_addrs" {
  value = "${aws_instance.webcounter[*].public_ip}:8000/get"
}