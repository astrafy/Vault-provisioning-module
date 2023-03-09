# Grand permissions on a KV
path "${kv_name}/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
