resource "keycloak_realm" "safedx" {
  realm                = "safedx"
  enabled              = true
  display_name         = "safedx"
  display_name_html    = "<b>safedx</b>"
  login_theme          = "keycloak"
  access_code_lifespan = "1h"
  password_policy      = "length(2)"
}
