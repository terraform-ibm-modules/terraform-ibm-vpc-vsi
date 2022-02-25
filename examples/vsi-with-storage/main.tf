#####################################################
# vsi with storage Example
# Copyright 2022 IBM
#####################################################

module "volume" {
  source = "../../modules/storage"

  for_each       = { for volume in var.volume_list : volume.name => volume }
  name           = each.value.name
  location       = each.value.location
  volume_profile = each.value.volume_profile
}

locals {
  volumes = [for volume in module.volume : volume.volume_id]
}

module "instance" {
  source = "../../modules/vsi"

  name                      = var.name
  vpc_id                    = var.vpc_id
  location                  = var.location
  image                     = var.image
  profile                   = var.profile
  ssh_keys                  = var.ssh_keys
  primary_network_interface = var.primary_network_interface
  user_data                 = var.user_data
  boot_volume               = var.boot_volume
  volumes                   = local.volumes
}