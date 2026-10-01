resource "slu_random_password" "ondrej_initial_password" {}

resource "keycloak_user" "ondrej" {
  lifecycle {
    ignore_changes = [required_actions]
  }

  realm_id = keycloak_realm.foxconn.id
  username = "ondrej"
  enabled  = true

  email      = "ondrej@sikademo.com"
  first_name = "Ondrej"
  last_name  = "Sika"

  initial_password {
    value     = slu_random_password.ondrej_initial_password.result
    temporary = true
  }
}

output "ondrej_initial_password" {
  value     = slu_random_password.ondrej_initial_password.result
  sensitive = true
}
