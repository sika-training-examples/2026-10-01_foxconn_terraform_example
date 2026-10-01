resource "keycloak_realm" "foxconn" {
  realm                = "foxconn"
  enabled              = true
  display_name         = "foxconn"
  display_name_html    = "<b>foxconn</b>"
  login_theme          = "keycloak"
  access_code_lifespan = "1h"
  password_policy      = "length(1)"
}
