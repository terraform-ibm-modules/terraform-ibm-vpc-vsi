#####################################################
# SSH Key Configuartionn Variables
# Copyright 2022 IBM
#####################################################

variable "is_provision" {
  description = "Disable this to read the existing ssh key"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the SSH Key"
  type        = string
}

#####################################################
# Optional Parameters
#####################################################

variable "public_key" {
  description = "SSH Public key data"
  type        = string
  default     = null
}

variable "resource_group_id" {
  description = "ID of resource group."
  type        = string
  default     = null
}

variable "tags" {
  description = "List of Tags for the SSH Key"
  type        = list(string)
  default     = null
}