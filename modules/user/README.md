## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | 5.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_keycloak"></a> [keycloak](#provider\_keycloak) | 5.9.0 |
| <a name="provider_slu"></a> [slu](#provider\_slu) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_initial_password_dogsay"></a> [initial\_password\_dogsay](#module\_initial\_password\_dogsay) | git::https://github.com/ondrejsika/terraform-training.git//modules/dogsay | n/a |

## Resources

| Name | Type |
|------|------|
| [keycloak_user.this](https://registry.terraform.io/providers/keycloak/keycloak/5.9.0/docs/resources/user) | resource |
| [slu_mail_send.initial_password](https://registry.terraform.io/providers/sikalabsx/slu/latest/docs/resources/mail_send) | resource |
| [slu_random_password.initial_password](https://registry.terraform.io/providers/sikalabsx/slu/latest/docs/resources/random_password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_email"></a> [email](#input\_email) | The email for the Keycloak user | `string` | n/a | yes |
| <a name="input_enable_attributes"></a> [enable\_attributes](#input\_enable\_attributes) | Whether to enable custom attributes for the Keycloak user | `bool` | `false` | no |
| <a name="input_first_name"></a> [first\_name](#input\_first\_name) | The first name for the Keycloak user | `string` | n/a | yes |
| <a name="input_last_name"></a> [last\_name](#input\_last\_name) | The last name for the Keycloak user | `string` | n/a | yes |
| <a name="input_realm_id"></a> [realm\_id](#input\_realm\_id) | The ID of the Keycloak realm | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | The username for the Keycloak user | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_initial_password"></a> [initial\_password](#output\_initial\_password) | n/a |
