resource "vault_identity_group" "group" {
  for_each = var.groups
  name     = each.key
  type     = "external"
  policies = each.value
}

resource "vault_identity_group_alias" "group-alias" {
  for_each       = var.groups
  name           = each.key
  mount_accessor = vault_jwt_auth_backend.oidc_google[0].accessor
  canonical_id   = vault_identity_group.group[each.key].id
  depends_on     = [vault_identity_group.group]
}
