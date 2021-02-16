# terraform-azurerm-acr

Terraform module for AzureRM ACR.

This module validates the name according to Azure resource naming restrictions.

## Usage

```hcl:examples/basic/main.tf

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| azurerm | >= 2.41.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.41.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [azurerm_container_registry](https://registry.terraform.io/providers/hashicorp/azurerm/2.41.0/docs/resources/container_registry) |
| [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/2.41.0/docs/data-sources/resource_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_enabled | Specifies whether the admin user is enabled. | `bool` | `true` | no |
| georeplication\_locations | A list of Azure locations where the container registry should be geo-replicated<br>(sku must be Premium). | `list(string)` | `[]` | no |
| name | Specifies the name of the Container Registry.<br>Changing this forces a new resource to be created. | `string` | n/a | yes |
| resource\_group\_name | The name of the resource group in which to create the ACR.<br>The Resource Group must already exist. | `string` | n/a | yes |
| sku | The SKU name of the container registry.<br>Possible values are Basic, Standard and Premium. | `string` | `"Premium"` | no |
| tags | A mapping of tags which should be assigned to Resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| admin\_password | The Password associated with the Container Registry Admin<br>account - if the admin account is enabled. |
| admin\_username | The Username associated with the Container Registry Admin<br>account - if the admin account is enabled. |
| fqdn | ACR resource FQDN. |
| id | ACR resource ID. |
| login\_server | The URL that can be used to log into the container registry. |
| name | ACR resource name. |
| rg\_name | Resource Group name. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Run tests

```bash
cd test/
go test -v
```

## References

* [Azure resource naming restrictions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)
* [Terraform azurerm_container_registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry)
