# Instance Module Example

This module is used to create an Instance

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "instance" {
  source = "./modules/vsi"

  is_provision              = true
  name                      = var.name
  vpc_id                    = data.ibm_is_vpc.vpc.id
  resource_group_id         = data.ibm_resource_group.resource_group.id
  location                  = var.location
  image                     = var.image
  profile                   = var.profile
  ssh_keys                  = var.ssh_keys
  primary_network_interface = var.primary_network_interface
  user_data                 = var.user_data
  boot_volume               = var.boot_volume
  network_interfaces        = var.network_interfaces
  volumes                   = var.data_volumes
  tags                      = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| is_provision | Disable this to read the existing vsi| bool | true | no |
| name | Name of the instance | string | n/a | yes |
| private_key | Name of the private_key of the existing windows vsi instance | string | n/a | no |
| passphrase | Name of the passphrase of the existing windows vsi instance | string | n/a | yes |
| vpc_id | VPC ID to which the vsi is to attached | string | n/a | no |
| instance_template_id | Id of the instance template | string | n/a | no |
| location | Zone of the instance  | string | n/a | no |
| profile | Profile type for the Instance  | string | n/a | no |
| dedicated_host | Unique Identifier of the Dedicated Host where the instance is to be placed | string | n/a | no |
| dedicated_host_group | Unique Identifier of the Dedicated Host Group where the instance is to be placed | string | n/a | no |
| placement_group | Unique Identifier of the Placement Group for restricting the placement of the instance | string | n/a | no |
| total_volume_bandwidth | The amount of bandwidth (in megabits per second) allocated exclusively to instance storage volumes | number | n/a | no |
| ssh\_keys | List of ssh key IDs to the instance  | list(string) | n/a | no |
| tags | list of tags for the instance  | list(string) | n/a | no |
| wait_before_delete | Enables stopping of instance before deleting and waits till deletion is complete | bool | n/a | no |
| action | Action to be taken on the instance. Supported values are stop, start, or reboot | string | n/a | no |
| force_action | If set to true, the action will be forced immediately, and all queued actions deleted. Ignored for the start action | string | n/a | no|
| primary\_network\_interface | List of primary_network_interface that are to be attached to the instance  | list(object) | n/a | no |
| network\_interfaces | List of network_interfaces that are to be attached to the instance  | list(object) | n/a | no |
| user\_data | User Data for the instance  | string | n/a | no |
| image | Image ID for the instance  | string | n/a | no |
| boot\_volume | List of boot volume that are to be attached to the instance| list(object) | n/a | no |
| volumes | List of volume ids that are to be attached to the instance  | list(string) | n/a | no |
| auto_delete_volume | Auto delete volume along with instance | bool | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| force_recovery_time | Define timeout to force the instances to start/stop in minutes | number | n/a | no |
| enable_floating_ip | Enable this to add floating IP to the VSI | bool | true | no |

## primary\_network\_interface inputs:

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| subnet | ID of the subnet for this interface  | string | n/a | yes |
| allow_ip_spoofing | Indicates whether IP spoofing is allowed on this interface  | bool | false | no |
| interface_name | Name of the network interface  | string | n/a | no |
| security_groups | A comma separated list of security groups to add to this primary network interface.  | list(string) | n/a | no |
| primary_ipv4_address | The IPV4 address of the interface.  | string | n/a | no |

## network\_interfaces inputs:

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| subnet | ID of the subnet for this interface  | string | n/a | yes |
| allow_ip_spoofing | Indicates whether IP spoofing is allowed on this interface  | bool | false | no |
| interface_name | Name of the network interface  | string | n/a | no |
| security_groups | A comma separated list of security groups to add to this network interface.  | list(string) | n/a | no |
| primary_ipv4_address | The IPV4 address of the interface.  | string | n/a | no |

## boot\_volume inputs:

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | The name of the boot volume  | string | n/a | yes |
| snapshot | The snapshot id of the volume to be used for creating boot volume attachment  | string | n/a | no |
| encryption | The type of encryption to use for the boot volume  | string | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | The ID of the Instance |
| primary\_network\_interface | The primary_network_interface IDs of the Instance |
| floating\_ip\_id | The ID of the Floating IP |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->