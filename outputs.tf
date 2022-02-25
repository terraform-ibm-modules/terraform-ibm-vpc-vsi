###################################################################
# outputs
# Copyright 2022 IBM
###################################################################

output "instance_id" {
  description = "The ID of the Instance"
  value       = module.instance.instance_id
}

output "primary_network_interface" {
  description = "The primary_network_interface of the Instance"
  value       = module.instance.primary_network_interface
}

output "floating_ip_id" {
  description = "The ID of the Floating IP"
  value       = module.instance.floating_ip_id
}