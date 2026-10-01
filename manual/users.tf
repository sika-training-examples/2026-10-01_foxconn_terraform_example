locals {
  users = {
    "dela" = {
      first_name = "Dela"
      last_name  = "Sika"
    }
    "nela" = {
      first_name = "Nela"
      last_name  = "Sika"
    }
    "bela" = {
      first_name = "Bela"
      last_name  = "Sika"
    }
    "cela" = {
      first_name = "Cela"
      last_name  = "Sika"
    }
  }
}

module "users" {
  source = "../modules/user"

  for_each = local.users

  realm_id   = keycloak_realm.manual.id
  username   = each.key
  first_name = each.value.first_name
  last_name  = each.value.last_name
  email      = "${each.key}@foxconn.com"
}
