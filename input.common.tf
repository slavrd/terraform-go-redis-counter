variable "key_pair_name" {
  type        = string
  description = "The AWS Key Pair name to use for the VMs"
}

variable "private_key_path" {
  type        = string
  description = "The the private key of the AWS Key Pair used for the VMs"
  default     = null
}

variable "redis_password" {
  type        = string
  description = "The password for the Redis server the webcounter should connect to."
}

variable "name_prefix" {
  type        = string
  description = "Prefix for the Name tag for all resources."
}

variable "common_tags" {
  type = map
  default = {
    project = ""
    owner   = ""
  }
  description = "Default tags which will be applied to all the created resources. Name tag is set separetely."
}