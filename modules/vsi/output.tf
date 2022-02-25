#####################################################
# Instance outputs
# Copyright 2022 IBM
#####################################################

output "instance_id" {
  description = "The ID of the Instance"
  value       = local.vsi_id
}

output "primary_network_interface" {
  description = "The primary_network_interface of the Instance"
  value       = var.is_provision ? ibm_is_instance.vsi.0.primary_network_interface.*.id : data.ibm_is_instance.ds_vsi.0.primary_network_interface.*.id
}

output "floating_ip_id" {
  description = "The ID of the Floating IP"
  value       = var.enable_floating_ip ? ibm_is_floating_ip.fip.0.id : null
}