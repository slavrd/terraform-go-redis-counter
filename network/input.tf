variable "vpc_cidr_block" {
  type        = string
  default     = "172.16.0.0/20"
  description = "CIDR block to assign to the VPC"
}

variable "common_tags" {
  type = map
  default = {
    project     = "webcounter"
    environment = "prod"
  }
  description = "Default tags which will be applied to all the created resources. The current default keys must be allways present!"
}

variable "public_subnet_cidrs" {
  type        = list
  default     = ["172.16.0.0/24"]
  description = ""
}

variable "private_subnet_cidrs" {
  type        = list
  default     = ["172.16.4.0/24"]
  description = ""
}
