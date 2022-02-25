#####################################################
# SSH Key Resource Configuration
# Copyright 2022 IBM
#####################################################

data "ibm_is_ssh_key" "ds_ssh_key" {
  count          = var.is_provision ? 0 : 1
  name           = var.name
  resource_group = var.resource_group_id
}


resource "ibm_is_ssh_key" "ssh_key" {
  count          = var.is_provision ? 1 : 0
  name           = var.name
  public_key     = var.public_key
  tags           = var.tags
  resource_group = var.resource_group_id
}