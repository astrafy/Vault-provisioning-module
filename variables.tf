variable "policies" {
  description = "Vault policies to create from template"
  type = map(object({
    template = string
    params = list(object({
      key = string
      value = string
    }))
  }))
}

variable "enable_gcp_auth_backend" {
  description = "Enable GCP authentication backend"
  type = bool
}

variable "gcp_auth_backend_roles" {
  description = "GCP auth backend roles to create. Bound service account must exist and policies must be created using the `policies` variable"
  type = map(object({
    bound_service_accounts = list(string)
    token_policies = list(string)
  }))
}
