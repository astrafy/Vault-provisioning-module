<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >=3.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >=3.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_gcp_auth_backend.gcp](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_auth_backend) | resource |
| [vault_gcp_auth_backend_role.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_auth_backend_role) | resource |
| [vault_policy.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_gcp_auth_backend"></a> [enable\_gcp\_auth\_backend](#input\_enable\_gcp\_auth\_backend) | Enable GCP authentication backend | `bool` | n/a | yes |
| <a name="input_gcp_auth_backend_roles"></a> [gcp\_auth\_backend\_roles](#input\_gcp\_auth\_backend\_roles) | GCP auth backend roles to create. Bound service account must exist and policies must be created using the `policies` variable | <pre>map(object({<br>    bound_service_accounts = list(string)<br>    token_policies = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_policies"></a> [policies](#input\_policies) | Vault policies to create from template | <pre>map(object({<br>    template = string<br>    params = list(object({<br>      key = string<br>      value = string<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->