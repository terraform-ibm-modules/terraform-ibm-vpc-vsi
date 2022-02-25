# VPC Block Storage Module Example

This module is used to create a Block Storage (volume)

## Example Usage
```

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "volume" {
  source = "./modules/storage"

  is_provision         = true
  name                 = var.name
  resource_group_id    = data.ibm_resource_group.resource_group.id
  location             = var.location
  volume_profile       = var.volume_profile
  iops                 = var.iops
  size                 = var.size
  encryption           = var.encryption
  delete_all_snapshots = var.delete_all_snapshots
  tags                 = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| is_provision | Disable this to read the existing block storage | bool | true | no |
| name | Name of the Volume | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| location | Volume Zone | string | n/a | no |
| volume\_profile | The profile to use for this volume | string | n/a | no |
| iops | The total i/o operations per sec for the storage. This value is required for `custom` type volume_profile only | number | n/a | no |
| size | The capacity of the volume in gigabytes | number | n/a | no |
| encryption | The encryption key to use for encrypting this volume | string | n/a | no |
| delete_all_snapshots | Deletes all snapshots created from this volume | bool | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| volume\_id | The ID of the Volume |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->