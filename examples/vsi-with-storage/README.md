# vsi with storage Example

This example illustrates how to create the vsi with storage.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| volume_list | List of volumes that are to be attached to the instance  | list(string) | n/a | no |
| name | Name of the instance | string | n/a | yes |
| vpc_id | VPC ID to which the vsi is to attached | string | n/a | yes |
| location | Zone of the instance  | string | n/a | yes |
| profile | Profile type for the Instance  | string | n/a | yes |
| ssh\_keys | List of ssh key IDs to the instance  | list(string) | n/a | yes |
| primary\_network\_interface | List of primary_network_interface that are to be attached to the instance  | list(object) | n/a | yes |
| user\_data | User Data for the instance  | string | n/a | no |
| image | Image ID for the instance  | string | n/a | yes |
| boot\_volume | List of boot volume that are to be attached to the instance| list(object) | n/a | no |



<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## How to input variable values through a file

To review the plan for the configuration defined (no resources actually provisioned)

`terraform plan -var-file=./input.tfvars`

To execute and start building the configuration defined in the plan (provisions resources)

`terraform apply -var-file=./input.tfvars`

To destroy the VPC and all related resources

`terraform destroy -var-file=./input.tfvars`

All optional parameters by default will be set to null in respective example's variable.tf file. If user wants to configure any optional paramter he has overwrite the default value.

## Note

For all optional fields, default values (Eg: `null`) are given in variable.tf file. User can configure the same by overwriting with appropriate values.