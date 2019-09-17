output "public_subnet_ids" {
  value       = [for cidr in var.public_subnet_cidrs : aws_subnet.public[cidr].id]
  description = "Ids of the 'public' subents"
}

output "private_subnet_ids" {
  value       = [for cidr in var.private_subnet_cidrs : aws_subnet.private[cidr].id]
  description = "Ids of the 'private' subents"
}