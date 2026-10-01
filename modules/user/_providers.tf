terraform {
  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = "5.9.0"
    }
    slu = {
      source = "sikalabsx/slu"
    }
  }
}
