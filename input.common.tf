variable "key_pair_name" {
  type        = string
  description = "The AWS Key Pair name to use for the VMs"
}

variable "private_key_path" {
  type        = string
  description = "The the private key of the AWS Key Pair used for the VMs"
}

variable "redis_password" {
  type        = string
  description = "The password for the Redis server the webcounter should connect to."
}

variable "common_tags" {
  type = map
  default = {
    project     = "webcounter"
    environment = "prod"
  }
  description = "Default tags which will be applied to all the created resources. The current default keys must be allways present!"
}