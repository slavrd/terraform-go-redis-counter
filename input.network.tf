variable "net_vpc_cidr_block" {
  type        = string
  default     = "172.16.0.0/20"
  description = "CIDR block to assign to the VPC which will be crated"
}

variable "net_public_subnet_cidrs" {
  type        = list
  default     = ["172.16.0.0/24"]
  description = ""
}

variable "net_private_subnet_cidrs" {
  type        = list
  default     = ["172.16.4.0/24"]
  description = ""
}
