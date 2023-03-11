# Read permissions on a KV
path "${kv_name}/*" {
  capabilities = ["read", "list" ]
}
