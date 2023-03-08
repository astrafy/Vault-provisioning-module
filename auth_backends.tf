resource "vault_gcp_auth_backend" "gcp" {
  count = var.enable_gcp_auth_backend ? 1 : 0
  # Empty credentials to use default account with Workload Identity on GKE
}

resource "vault_gcp_auth_backend_role" "this" {
  for_each = var.gcp_auth_backend_roles
  backend                = vault_gcp_auth_backend.gcp[0].path
  role                   = each.key
  type                   = "iam"
  bound_service_accounts = each.value.bound_service_accounts
  token_policies         = [for item in each.value.token_policies : vault_policy.this[item].name]
  max_jwt_exp            = "3600"
}
