variable "net_vpc_cidr_block" {
  type        = string
  description = "CIDR block to assign to the VPC which will be crated"
}

variable "net_public_subnet_cidrs" {
  type        = list(string)
  description = "List of public subnet CIDRs"
}

variable "net_private_subnet_cidrs" {
  type        = list(string)
  description = "List of private subnet CIDRs"
}
