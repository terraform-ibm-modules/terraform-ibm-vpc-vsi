#####################################################
# Instance Resource
# Copyright 2020 IBM
#####################################################

data "ibm_is_instance" "ds_vsi" {
  count       = var.is_provision ? 0 : 1
  name        = var.name
  private_key = var.private_key
  passphrase  = var.passphrase
}

resource "ibm_is_instance" "vsi" {
  count                  = var.is_provision ? 1 : 0
  name                   = var.name
  vpc                    = var.vpc_id
  instance_template      = var.instance_template_id
  zone                   = var.location
  profile                = var.profile
  dedicated_host         = var.dedicated_host != null && var.dedicated_host_group == null && var.placement_group == null ? var.dedicated_host : null
  dedicated_host_group   = var.dedicated_host_group != null && var.dedicated_host == null && var.placement_group == null ? var.dedicated_host_group : null
  placement_group        = var.placement_group != null && var.dedicated_host_group == null && var.dedicated_host == null ? var.placement_group : null
  total_volume_bandwidth = var.total_volume_bandwidth
  keys                   = var.ssh_keys
  tags                   = var.tags
  wait_before_delete     = var.wait_before_delete
  action                 = var.action
  force_action           = var.action != null && var.force_action != null ? var.force_action : null
  dynamic "primary_network_interface" {
    for_each = var.primary_network_interface
    content {
      allow_ip_spoofing    = primary_network_interface.value.allow_ip_spoofing != false ? true : false
      name                 = primary_network_interface.value.interface_name != "" ? primary_network_interface.value.interface_name : null
      primary_ipv4_address = primary_network_interface.value.primary_ipv4_address != "" ? primary_network_interface.value.primary_ipv4_address : null
      security_groups      = primary_network_interface.value.security_groups != null ? primary_network_interface.value.security_groups : []
      subnet               = primary_network_interface.value.subnet
    }
  }
  dynamic "network_interfaces" {
    for_each = var.network_interfaces
    content {
      allow_ip_spoofing    = network_interfaces.value.allow_ip_spoofing
      name                 = network_interfaces.value.interface_name
      primary_ipv4_address = network_interfaces.value.primary_ipv4_address
      security_groups      = network_interfaces.value.security_groups
      subnet               = network_interfaces.value.subnet
    }
  }
  user_data = var.user_data
  image     = var.location != null && var.primary_network_interface != null && var.ssh_keys != null && var.vpc_id != null && var.profile != null ? var.image : null
  dynamic "boot_volume" {
    for_each = var.boot_volume
    content {
      name       = (boot_volume.value.name != "" ? boot_volume.value.name : null)
      snapshot   = boot_volume.value.snapshot
      encryption = (boot_volume.value.encryption != "" ? boot_volume.value.encryption : null)
    }
  }
  volumes             = var.volumes
  auto_delete_volume  = var.auto_delete_volume
  resource_group      = var.resource_group_id
  force_recovery_time = var.force_recovery_time
}

locals {
  vsi_id = var.is_provision ? ibm_is_instance.vsi.0.id : data.ibm_is_instance.ds_vsi.0.id
}

##########################################################################################################
##########################################################################################################
# Floating IP Resource

resource "ibm_is_floating_ip" "fip" {
  for_each = var.enable_floating_ip && var.is_provision ? local.vsi_id : {}
  name     = "${each.value.name}-fip"
  target   = each.value.primary_network_interface.0.id
}