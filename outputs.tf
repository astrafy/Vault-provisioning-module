output "jwt_mount_accessors" {
  value = {for k,v in vault_jwt_auth_backend.this : k => v.accessor }
}
