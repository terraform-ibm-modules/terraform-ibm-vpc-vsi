#####################################################
# SSH Key outputs
# Copyright 2022 IBM
#####################################################

output "ssh_key_id" {
  description = "The ID of the ssh key"
  value       = var.is_provision ? ibm_is_ssh_key.ssh_key.0.id : data.ibm_is_ssh_key.ds_ssh_key.0.id
}

output "fingerprint" {
  description = "SSH key Fingerprint info"
  value       = var.is_provision ? ibm_is_ssh_key.ssh_key.0.fingerprint : data.ibm_is_ssh_key.ds_ssh_key.0.fingerprint
}