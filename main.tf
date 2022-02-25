###################################################################
# Instance module usage
###################################################################
module "instance" {
  source = "./modules/vsi"

  name                      = var.name
  is_provision              = var.is_provision
  private_key               = var.private_key
  passphrase                = var.passphrase
  vpc_id                    = var.vpc_id
  instance_template_id      = var.instance_template_id
  location                  = var.location
  profile                   = var.profile
  dedicated_host            = var.dedicated_host
  dedicated_host_group      = var.dedicated_host_group
  placement_group           = var.placement_group
  total_volume_bandwidth    = var.total_volume_bandwidth
  ssh_keys                  = var.ssh_keys
  tags                      = var.tags
  wait_before_delete        = var.wait_before_delete
  action                    = var.action
  force_action              = var.force_action
  primary_network_interface = var.primary_network_interface
  network_interfaces        = var.network_interfaces
  user_data                 = var.user_data
  image                     = var.image
  boot_volume               = var.boot_volume
  volumes                   = var.volumes
  auto_delete_volume        = var.auto_delete_volume
  resource_group_id         = var.resource_group_id
  force_recovery_time       = var.force_recovery_time
  enable_floating_ip        = var.enable_floating_ip
}