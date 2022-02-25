#####################################################
# vsi with storage parameters
# Copyright 2022 IBM
#####################################################

variable "volume_list" {
  description = "List of volumes that are to be attached to the instance"
  type = list(object({
    name           = string
    location       = string
    volume_profile = string
  }))
  default = null
}

variable "name" {
  description = "Enter The name of the vsi instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to which the vsi is to attached"
  type        = string
  default     = null
}

variable "location" {
  description = "Instance zone name"
  type        = string
  default     = null
}

variable "profile" {
  description = "Profile type for the Instance"
  type        = string
  default     = null
}

variable "primary_network_interface" {
  description = "primary_network_interface that is to be attached to the instance"
  type = list(object({
    allow_ip_spoofing    = string
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
    subnet               = string
  }))
  validation {
    condition     = length(var.primary_network_interface) <= 1
    error_message = "Only one primary network interface can be added."
  }
  default = null
}

variable "user_data" {
  description = "User data for the instance"
  type        = string
  default     = null
}

variable "image" {
  description = "Image ID for the instance"
  type        = string
  default     = null
}

variable "boot_volume" {
  description = "Boot volume that is to be attached to the instance"
  type = list(object({
    name       = string
    snapshot   = string
    encryption = string
  }))
  validation {
    condition     = length(var.boot_volume) <= 1
    error_message = "Only one boot volume can be added."
  }
  default = null
}

variable "ssh_keys" {
  description = "List of ssh key IDs for the instance"
  type        = list(string)
  default     = null
}