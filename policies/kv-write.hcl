# Write permissions on a KV
path "${kv_name}/*" {
  capabilities = [ "create", "update", "delete" ]
}
