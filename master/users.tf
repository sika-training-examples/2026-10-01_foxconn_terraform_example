module "foo_user" {
  source     = "../modules/user"
  realm_id   = keycloak_realm.master.id
  username   = "foo"
  first_name = "Foo"
  last_name  = "Foo"
  email      = "foo@foxconn.com"
}

module "bar_user" {
  source     = "../modules/user"
  realm_id   = keycloak_realm.master.id
  username   = "bar"
  first_name = "Bar"
  last_name  = "Bar"
  email      = "bar@foxconn.com"
}

module "baz_user" {
  source     = "../modules/user"
  realm_id   = keycloak_realm.master.id
  username   = "baz"
  first_name = "Baz"
  last_name  = "Baz"
  email      = "baz@foxconn.com"
}
