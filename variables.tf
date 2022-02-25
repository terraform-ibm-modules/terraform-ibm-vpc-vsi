#####################################################
# vsi module parameters
# Copyright 2022 IBM
#####################################################

variable "name" {
  description = "Enter The name of the vsi instance"
  type        = string
}

variable "is_provision" {
  description = "Disable this to read the existing vsi instance"
  type        = bool
  default     = true
}

variable "private_key" {
  description = "Enter The name of the private_key of the existing windows vsi instance"
  type        = string
  default     = null
}

variable "passphrase" {
  description = "Enter The name of the passphrase of the existing windows vsi instance"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "VPC ID to which the vsi is to attached"
  type        = string
  default     = null
}

variable "instance_template_id" {
  description = "Id of the instance template"
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

variable "dedicated_host" {
  description = "Unique Identifier of the Dedicated Host where the instance is to be placed"
  type        = string
  default     = null
}

variable "dedicated_host_group" {
  description = "Unique Identifier of the Dedicated Host Group where the instance is to be placed"
  type        = string
  default     = null
}

variable "placement_group" {
  description = "Unique Identifier of the Placement Group for restricting the placement of the instance"
  type        = string
  default     = null
}

variable "total_volume_bandwidth" {
  description = "The amount of bandwidth (in megabits per second) allocated exclusively to instance storage volumes"
  type        = number
  default     = null
}

variable "tags" {
  description = "list of tags for the instance"
  type        = list(string)
  default     = null
}

variable "wait_before_delete" {
  description = "Enables stopping of instance before deleting and waits till deletion is complete"
  type        = bool
  default     = null
}

variable "action" {
  description = "Action to be taken on the instance. Supported values are stop, start, or reboot"
  type        = string
  default     = null
}

variable "force_action" {
  description = "If set to true, the action will be forced immediately, and all queued actions deleted. Ignored for the start action."
  type        = bool
  default     = null
}

variable "primary_network_interface" {
  description = "primary_network_interface that is to be attached to the instance"
  type = list(object({
    allow_ip_spoofing    = bool
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

variable "network_interfaces" {
  description = "List of network_interfaces that are to be attached to the instance"
  type = list(object({
    allow_ip_spoofing    = bool
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
    subnet               = string
  }))
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

variable "auto_delete_volume" {
  description = "Auto delete volume along with instance"
  type        = bool
  default     = null
}

variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "force_recovery_time" {
  description = "Define timeout to force the instances to start/stop in minutes."
  type        = number
  default     = null
}

variable "volumes" {
  description = "List of volume ids that are to be attached to the instance"
  type        = list(string)
  default     = null
}

variable "ssh_keys" {
  description = "List of ssh key IDs for the instance"
  type        = list(string)
  default     = null
}

variable "enable_floating_ip" {
  description = "Enable this to add floating IP to the VSI"
  type        = bool
  default     = true
}