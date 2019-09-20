variable "wc_ami_id" {
  type        = string
  description = "The AWS AMI id to use for the webcounter VMs"
}

variable "wc_instance_count" {
  type        = number
  default     = 1
  description = "The number of webcounter VMs to create."
}

variable "wc_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the webcounter VMs to create."
}

variable "wc_subnet_ids" {
  type        = list
  default     = null
  description = "The subnet id in which to create the webcounter VMs."
}

variable "wc_associate_public_ip_address" {
  type        = bool
  default     = true
  description = "Weather the webcounter VMs should have public ip address."
}
