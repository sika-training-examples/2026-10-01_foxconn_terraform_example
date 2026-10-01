locals {
  users = {
    "aaa" = {
      first_name = "AAA"
      last_name  = "Sika"
    }
    "bbb" = {
      first_name = "BBB"
      last_name  = "Sika"
    }
    "ccc" = {
      first_name = "CCC"
      last_name  = "Sika"
    }
  }
}

resource "slu_random_password" "initial_passwords" {
  for_each = local.users
}

resource "keycloak_user" "users" {
  for_each = local.users

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      required_actions,
    ]
  }

  realm_id = keycloak_realm.safedx.id
  username = each.key
  enabled  = true

  email      = "${each.key}@sikademo.com"
  first_name = each.value.first_name
  last_name  = each.value.last_name

  initial_password {
    value     = slu_random_password.initial_passwords[each.key].result
    temporary = true
  }
}

output "initial_passwords" {
  value = {
    for k, v in slu_random_password.initial_passwords :
    k => v.result
  }
  sensitive = true
}

resource "slu_mail_send" "initial_passwords" {
  for_each = local.users

  from    = "ceo-dx@foxconn.com"
  to      = keycloak_user.users[each.key].email
  subject = "NEW INITIAL PASSWORD"
  message = <<EOT
Hi,

Your initial password is: ${slu_random_password.initial_passwords[each.key].result}

Ondrej,
CEO of Foxconn
EOT
}
