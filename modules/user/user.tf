variable "realm_id" {
  description = "The ID of the Keycloak realm"
  type        = string
}

variable "username" {
  description = "The username for the Keycloak user"
  type        = string
}

variable "first_name" {
  description = "The first name for the Keycloak user"
  type        = string
}

variable "last_name" {
  description = "The last name for the Keycloak user"
  type        = string
}

variable "email" {
  description = "The email for the Keycloak user"
  type        = string
}

variable "enable_attributes" {
  description = "Whether to enable custom attributes for the Keycloak user"
  type        = bool
  default     = false
}

resource "slu_random_password" "initial_password" {}

resource "keycloak_user" "this" {
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      required_actions,
      attributes["created-at"],
    ]
  }

  realm_id = var.realm_id
  username = var.username
  enabled  = true

  email      = var.email
  first_name = var.first_name
  last_name  = var.last_name

  attributes = var.enable_attributes ? {
    created-at = formatdate("YYYY-MM-DD", plantimestamp())
    updated-at = formatdate("YYYY-MM-DD", plantimestamp())
  } : {}

  initial_password {
    value     = slu_random_password.initial_password.result
    temporary = true
  }
}

module "initial_password_dogsay" {
  source = "git::https://github.com/ondrejsika/terraform-training.git//modules/dogsay"

  text = slu_random_password.initial_password.result
}

resource "slu_mail_send" "initial_password" {
  from    = "ceo@foxconn.com"
  to      = keycloak_user.this.email
  subject = "NEW INITIAL PASSWORD"
  message = <<EOT
Hi,

Your initial password is:

${module.initial_password_dogsay.output}

Ondrej,
CEO of Foxconn
EOT
}

output "initial_password" {
  value     = slu_random_password.initial_password.result
  sensitive = true
}
