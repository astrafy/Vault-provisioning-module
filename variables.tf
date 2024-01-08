variable "policies" {
  description = "Vault policies to create from template"
  type        = map(string)
  default     = {}
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

variable "jwt_auth_backends" {
  description = "Create JWT auth backends"
  type = map(object({
    oidc_discovery_url = string
    bound_issuer       = string
  }))
  default = {}
}

variable "jwt_auth_backend_roles" {
  description = "JWT auth backend roles to create. Policies must be created using the `policies` variable"
  type = map(object({
    backend               = string
    role_type             = string
    token_policies        = list(string)
    allowed_redirect_uris = list(string)
    claim_mappings        = map(string)
    bound_claims          = map(string)
    bound_claims_type     = string
    oidc_scopes           = list(string)
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

variable "verbose_oidc_logging" {
  description = "Verbose OIDC logging. Will save ID token in logs. Should not be used in production"
  type        = bool
  default     = false
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

variable "groups" {
  description = <<EOT
    Map from the group of google workspace to the role in Vault. 
    Example: {group@rubyx.io: k8s-reader}
  EOT
  type        = map(list(string))
  default     = {}
}
