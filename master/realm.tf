resource "keycloak_realm" "master" {
  realm                       = "master"
  enabled                     = true
  display_name                = "Keycloak"
  display_name_html           = "<div class=\"kc-logo-text\"><span>Keycloak</span></div>"
  default_signature_algorithm = "RS256"
}
