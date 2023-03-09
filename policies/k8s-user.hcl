# Grand permissions on k8s specific path
path "k8s/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
