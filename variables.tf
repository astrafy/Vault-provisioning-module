variable "policies" {
  description = "Vault policies to create from template"
  type = map(object({
    template = string
    params = list(object({
      key = string
      value = string
    }))
  }))
}
