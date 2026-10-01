data "keycloak_realm" "master_realm" {
  realm = "master"
}

data "keycloak_user" "master_admin" {
  realm_id = data.keycloak_realm.master_realm.id
  username = "admin"
}

output "master_realm_id" {
  value = data.keycloak_realm.master_realm.id
}

output "master_admin_user_id" {
  value = data.keycloak_user.master_admin.id
}
