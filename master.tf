module "master" {
  source = "./master"
}

import {
  to = module.master.keycloak_realm.master
  id = "master"
}
