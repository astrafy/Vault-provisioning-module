resource "vault_mount" "this" {
  for_each = toset(var.kv_secret_engines)
  path        = each.key
  type        = "kv"
  options     = { version = "2" }
  description = "${each.key} KV v2 secret engine mount"
}

resource "vault_kv_secret_backend_v2" "this" {
  for_each = toset(var.kv_secret_engines)
  mount = vault_mount.this[each.key].path
}
