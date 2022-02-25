#####################################################
# Block storage Resource Configuration
# Copyright 2022 IBM
#####################################################

data "ibm_is_volume" "ds_volume" {
  count = var.is_provision ? 0 : 1
  name  = var.name
  zone  = var.location
}

resource "ibm_is_volume" "volume" {
  count                = var.is_provision ? 1 : 0
  name                 = var.name
  zone                 = var.location
  profile              = var.volume_profile
  encryption_key       = (var.encryption != null ? var.encryption : null)
  capacity             = (var.size != null ? var.size : null)
  resource_group       = var.resource_group_id
  iops                 = (var.volume_profile == "custom" && var.iops != null ? var.iops : null)
  delete_all_snapshots = var.delete_all_snapshots
  tags                 = var.tags
}