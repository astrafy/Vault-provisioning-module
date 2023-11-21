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
| [vault_auth_backend.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_gcp_auth_backend.gcp](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_auth_backend) | resource |
| [vault_gcp_auth_backend_role.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_auth_backend_role) | resource |
| [vault_jwt_auth_backend.oidc_google](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |
| [vault_kubernetes_auth_backend_config.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_config) | resource |
| [vault_kubernetes_auth_backend_role.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_role) | resource |
| [vault_kv_secret_backend_v2.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kv_secret_backend_v2) | resource |
| [vault_mount.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_gcp_auth_backend"></a> [enable\_gcp\_auth\_backend](#input\_enable\_gcp\_auth\_backend) | Enable GCP authentication backend | `bool` | `false` | no |
| <a name="input_enable_oidc_google"></a> [enable\_oidc\_google](#input\_enable\_oidc\_google) | Enable Google OIDC for SSO | `bool` | `false` | no |
| <a name="input_gcp_auth_backend_roles"></a> [gcp\_auth\_backend\_roles](#input\_gcp\_auth\_backend\_roles) | GCP auth backend roles to create. Bound service account must exist and policies must be created using the `policies` variable | <pre>map(object({<br>    bound_service_accounts = list(string)<br>    token_policies         = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_jwt_auth_backend_roles"></a> [jwt\_auth\_backend\_roles](#input\_jwt\_auth\_backend\_roles) | JWT auth backend roles to create. Policies must be created using the `policies` variable | <pre>map(object({<br>    backend               = string<br>    role_type             = string<br>    token_policies        = list(string)<br>    allowed_redirect_uris = list(string)<br>    claim_mappings        = map(string)<br>    bound_claims          = map(string)<br>    bound_claims_type     = string<br>    oidc_scopes           = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_jwt_auth_backends"></a> [jwt\_auth\_backends](#input\_jwt\_auth\_backends) | Create JWT auth backends | <pre>map(object({<br>    oidc_discovery_url = string<br>    bound_issuer       = string<br>  }))</pre> | `{}` | no |
| <a name="input_kubernetes_auth_backend_roles"></a> [kubernetes\_auth\_backend\_roles](#input\_kubernetes\_auth\_backend\_roles) | Kubernetes auth backend roles | <pre>map(object({<br>    backend                          = string<br>    bound_service_account_names      = list(string)<br>    bound_service_account_namespaces = list(string)<br>    token_policies                   = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_kubernetes_auth_backends"></a> [kubernetes\_auth\_backends](#input\_kubernetes\_auth\_backends) | Create Kubernetes auth backends | <pre>map(object({<br>    kubernetes_host        = string<br>    disable_iss_validation = bool<br>  }))</pre> | `{}` | no |
| <a name="input_kv_secret_engines"></a> [kv\_secret\_engines](#input\_kv\_secret\_engines) | Definitions of KV secret engines | `list(string)` | `[]` | no |
| <a name="input_oidc_google_client_id"></a> [oidc\_google\_client\_id](#input\_oidc\_google\_client\_id) | OIDC Client ID | `string` | `null` | no |
| <a name="input_oidc_google_client_secret"></a> [oidc\_google\_client\_secret](#input\_oidc\_google\_client\_secret) | OIDC Client secret | `string` | `null` | no |
| <a name="input_oidc_google_default_role"></a> [oidc\_google\_default\_role](#input\_oidc\_google\_default\_role) | Specifies a default role for Google OIDC | `string` | `null` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | Vault policies to create from template | <pre>map(object({<br>    template = string<br>    params = list(object({<br>      key   = string<br>      value = string<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_verbose_oidc_logging"></a> [verbose\_oidc\_logging](#input\_verbose\_oidc\_logging) | Verbose OIDC logging. Will save ID token in logs. Should not be used in production | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_jwt_mount_accessors"></a> [jwt\_mount\_accessors](#output\_jwt\_mount\_accessors) | n/a |
<!-- END_TF_DOCS -->