#####################################################
# VPC Block Storage
# Copyright 2020 IBM
#####################################################

output "volume_id" {
  description = "The ID of the volume"
  value       = var.is_provision ? ibm_is_volume.volume.0.id : data.ibm_is_volume.ds_volume.0.id
}