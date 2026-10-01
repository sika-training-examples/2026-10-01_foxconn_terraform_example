module "manual" {
  source = "./manual"
}
import {
  to = module.manual.keycloak_realm.manual
  id = "manual"
}
