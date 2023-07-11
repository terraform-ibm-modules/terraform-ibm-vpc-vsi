# IBM Cloud VPC VSI - Terraform Module

---

## Module archived

:spider_web: This repo is no longer maintained and is archived. Use the following public module if you consume the module from GitHub: [terraform-ibm-landing-zone-vsi](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone-vsi)


## Changes if you use the Hashicorp registry

:exclamation: **Important:**  This module will be deleted from the Hashicorp registry on 1 August 2023. 

If you  consume the module from the Hashicorp registry, use [landing-zone-vsi](https://registry.terraform.io/modules/terraform-ibm-modules/landing-zone-vsi/ibm/latest) instead.

---

Terraform Module repository to create VPC VSI


Scenarios to construct sub-modules

1. Most commonly used VPC network resources for VSI Creation
2. Creation of VSI using a template
3. Grouping the VSIs
6. Creation of SSH key for the VSI
7. Assigning Public/Floating IPs to the VSI
8. Attaching storage to the VSI
9. Creation of VSI on dedicated host/group


## Compatibility

This module is meant for use with Terraform 0.13 (and higher).

## Usage

Full examples are in the [examples](./examples/) folder, demonstarte how to use a module through a template:

## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.13 (or later)
- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

## Install

### Terraform

Be sure you have the correct Terraform version (0.13), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform plugins

Be sure you have the compiled plugins on $HOME/.terraform.d/plugins/

- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

### Pre-commit hooks

Run the following command to execute the pre-commit hooks defined in .pre-commit-config.yaml file
```
pre-commit run -a
```
You can install pre-coomit tool using

```
pip install pre-commit
```
or
```
pip3 install pre-commit
```
## How to input variable values through a file

To review the plan for the configuration defined (no resources actually provisioned)
```
terraform plan -var-file=./input.tfvars
```
To execute and start building the configuration defined in the plan (provisions resources)
```
terraform apply -var-file=./input.tfvars
```

To destroy the VPC and all related resources
```
terraform destroy -var-file=./input.tfvars
```

## Note

All optional parameters, by default, will be set to `null` in respective example's variable.tf file. You can also override these optional parameters.

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
| tags | list of tags for the instance  | list(string) | n/a | no |
| wait_before_delete | Enables stopping of instance before deleting and waits till deletion is complete | bool | n/a | no |
| action | Action to be taken on the instance. Supported values are stop, start, or reboot | string | n/a | no |
| force_action | If set to true, the action will be forced immediately, and all queued actions deleted. Ignored for the start action | string | n/a | no|
| primary\_network\_interface | List of primary_network_interface that are to be attached to the instance  | list(object) | n/a | no |
| network\_interfaces | List of network_interfaces that are to be attached to the instance  | list(object) | n/a | no |
| user\_data | User Data for the instance  | string | n/a | no |
| image | Image ID for the instance  | string | n/a | no |
| boot\_volume | List of boot volume that are to be attached to the instance| list(object) | n/a | no |
| auto_delete_volume | Auto delete volume along with instance | bool | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| force_recovery_time | Define timeout to force the instances to start/stop in minutes | number | n/a | no |
| ssh\_keys | List of ssh key IDs to the instance  | list(string) | n/a | no |
| volumes | List of volume ids that are to be attached to the instance  | list(string) | n/a | no |
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
