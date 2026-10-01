terraform {
  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = "5.9.0"
    }
  }
}

variable "keycloak_password" {
  description = "The password for the Keycloak admin user"
  type        = string
  sensitive   = true
}

provider "keycloak" {
  url       = "https://keycloak.sikademo.com"
  client_id = "admin-cli"
  username  = "admin"
  password  = var.keycloak_password
}
