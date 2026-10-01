resource "keycloak_realm_user_profile" "foxconn" {
  realm_id = keycloak_realm.foxconn.id

  // Built-in attributes (must be kept, otherwise Keycloak drops them from the profile)

  attribute {
    name         = "username"
    display_name = "$${username}"

    validator {
      name   = "length"
      config = { min = "3", max = "255" }
    }
    validator {
      name = "username-prohibited-characters"
    }
    validator {
      name = "up-username-not-idn-homograph"
    }

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }
  }

  attribute {
    name         = "email"
    display_name = "$${email}"

    validator {
      name = "email"
    }
    validator {
      name   = "length"
      config = { max = "255" }
    }

    required_for_roles = ["user"]

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }
  }

  attribute {
    name         = "firstName"
    display_name = "$${firstName}"

    validator {
      name   = "length"
      config = { max = "255" }
    }
    validator {
      name = "person-name-prohibited-characters"
    }

    required_for_roles = ["user"]

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }
  }

  attribute {
    name         = "lastName"
    display_name = "$${lastName}"

    validator {
      name   = "length"
      config = { max = "255" }
    }
    validator {
      name = "person-name-prohibited-characters"
    }

    required_for_roles = ["user"]

    permissions {
      view = ["admin", "user"]
      edit = ["admin", "user"]
    }
  }

  // Custom attributes (managed by Terraform, read-only for users)

  attribute {
    name         = "created-at"
    display_name = "Created At"
    group        = "user-metadata"

    validator {
      name = "pattern"
      config = {
        pattern       = "^\\d{4}-\\d{2}-\\d{2}$"
        error-message = "Must be a date in format YYYY-MM-DD"
      }
    }

    permissions {
      view = ["admin", "user"]
      edit = ["admin"]
    }
  }

  attribute {
    name         = "updated-at"
    display_name = "Updated At"
    group        = "user-metadata"

    validator {
      name = "pattern"
      config = {
        pattern       = "^\\d{4}-\\d{2}-\\d{2}$"
        error-message = "Must be a date in format YYYY-MM-DD"
      }
    }

    permissions {
      view = ["admin", "user"]
      edit = ["admin"]
    }
  }

  group {
    name                = "user-metadata"
    display_header      = "User metadata"
    display_description = "Attributes, which refer to user metadata"
  }
}
