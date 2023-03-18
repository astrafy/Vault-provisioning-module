variable "policies" {
  description = "Vault policies to create from template"
  type = map(object({
    template = string
    params = list(object({
      key   = string
      value = string
    }))
  }))
  default = {}
}

variable "enable_gcp_auth_backend" {
  description = "Enable GCP authentication backend"
  type        = bool
  default     = false
}

variable "gcp_auth_backend_roles" {
  description = "GCP auth backend roles to create. Bound service account must exist and policies must be created using the `policies` variable"
  type = map(object({
    bound_service_accounts = list(string)
    token_policies         = list(string)
  }))
  default = {}
}

variable "enable_oidc_google" {
  description = "Enable Google OIDC for SSO"
  type        = bool
  default     = false
}

variable "jwt_auth_backend_roles" {
  description = "JWT auth backend roles to create. Policies must be created using the `policies` variable"
  type = map(object({
    backend               = string
    role_type             = string
    token_policies        = list(string)
    allowed_redirect_uris = list(string)
    bound_claims          = map(string)
  }))
  default = {}
}

variable "oidc_google_default_role" {
  description = "Specifies a default role for Google OIDC"
  type        = string
  default     = null
}

variable "oidc_google_client_id" {
  description = "OIDC Client ID"
  type        = string
  default     = null
}

variable "oidc_google_client_secret" {
  description = "OIDC Client secret"
  type        = string
  sensitive   = true
  default     = null
}

variable "kv_secret_engines" {
  description = "Definitions of KV secret engines"
  type        = list(string)
  default     = []
}

variable "kubernetes_auth_backends" {
  description = "Create Kubernetes auth backends"
  type = map(object({
    kubernetes_host        = string
    disable_iss_validation = bool
  }))
  default = {}
}

variable "kubernetes_auth_backend_roles" {
  description = "Kubernetes auth backend roles"
  type = map(object({
    backend                          = string
    bound_service_account_names      = list(string)
    bound_service_account_namespaces = list(string)
    token_policies                   = list(string)
  }))
}
