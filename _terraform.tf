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

provider "slu" {
  smtp_host = "127.0.0.1"
  smtp_port = 1025
}
