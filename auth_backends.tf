resource "vault_gcp_auth_backend" "gcp" {
  count = var.enable_gcp_auth_backend ? 1 : 0
  # Empty credentials to use default account with Workload Identity on GKE
}

resource "vault_gcp_auth_backend_role" "this" {
  for_each               = var.gcp_auth_backend_roles
  backend                = var.enable_gcp_auth_backend ? vault_gcp_auth_backend.gcp[0].path : "gcp"
  role                   = each.key
  type                   = "iam"
  bound_service_accounts = each.value.bound_service_accounts
  token_policies         = [for item in each.value.token_policies : vault_policy.this[item].name]
  max_jwt_exp            = "3600"
}

resource "vault_jwt_auth_backend" "oidc_google" {
  count              = var.enable_oidc_google ? 1 : 0
  description        = "OIDC Google Provider"
  path               = "oidc"
  type               = "oidc"
  oidc_discovery_url = "https://accounts.google.com"
  oidc_client_id     = var.oidc_google_client_id
  oidc_client_secret = var.oidc_google_client_secret
  bound_issuer       = "https://accounts.google.com"
  default_role       = var.oidc_google_default_role
}

resource "vault_jwt_auth_backend_role" "this" {
  for_each              = var.jwt_auth_backend_roles
  backend               = each.value.backend
  role_name             = each.key
  token_policies        = [for item in each.value.token_policies : vault_policy.this[item].name]
  user_claim            = "sub"
  role_type             = each.value.role_type
  allowed_redirect_uris = each.value.allowed_redirect_uris
  bound_claims          = each.value.bound_claims
  depends_on            = [vault_jwt_auth_backend.oidc_google]
  verbose_oidc_logging  = var.verbose_oidc_logging
}

resource "vault_auth_backend" "kubernetes" {
  for_each = var.kubernetes_auth_backends
  type     = "kubernetes"
  path     = each.key
}

resource "vault_kubernetes_auth_backend_config" "kubernetes" {
  for_each               = var.kubernetes_auth_backends
  backend                = vault_auth_backend.kubernetes[each.key].path
  kubernetes_host        = each.value.kubernetes_host
  disable_iss_validation = each.value.disable_iss_validation
}

resource "vault_kubernetes_auth_backend_role" "kubernetes" {
  for_each                         = var.kubernetes_auth_backend_roles
  backend                          = vault_auth_backend.kubernetes[each.value.backend].path
  role_name                        = each.key
  bound_service_account_names      = each.value.bound_service_account_names
  bound_service_account_namespaces = each.value.bound_service_account_namespaces
  token_policies                   = [for item in each.value.token_policies : vault_policy.this[item].name]
  token_ttl                        = 3600
}
