resource "vault_policy" "this" {
  for_each = var.policies
  name   = each.key
  policy = templatefile("${path.module}/policies/${each.value.template}",
    {for item in each.value.params : item.key => item.value}
  )
}