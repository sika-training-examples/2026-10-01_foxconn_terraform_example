moved {
  from = keycloak_user.ondrej
  to   = module.foxconn.keycloak_user.ondrej
}

moved {
  from = keycloak_user.users
  to   = module.foxconn.keycloak_user.users
}

moved {
  from = slu_random_password.initial_passwords
  to   = module.foxconn.slu_random_password.initial_passwords
}

moved {
  from = slu_mail_send.initial_passwords
  to   = module.foxconn.slu_mail_send.initial_passwords
}
