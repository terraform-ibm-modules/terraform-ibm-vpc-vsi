# Module SSH Key

This module is used to create an SSH Key

## Example Usage
```
data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "ssh-key" {
  source = "./modules/ssh-key"

  is_provision      = true
  name              = var.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  public_key        = var.public_key
  tags              = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| is_provision | Disable this to read the existing ssh key | bool | true | no |
| name | Name of the ssh key | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| public_key | SSH Public key data of the new key | string | n/a | no |
| tags | List of tags to attach  to the new key | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| ssh\_key\_id | The ID of the SSH Key |
| fingerprint | SSH key Fingerprint info |