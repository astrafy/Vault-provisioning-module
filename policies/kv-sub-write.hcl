# Read capabilities to a KV subpath specified by some metadata
path "${kv_name}/data/{{identity.entity.aliases.${mount_accessor}.metadata.${metadata_key}}}/*" {
  capabilities = [ "create", "update", "delete" ]
}
