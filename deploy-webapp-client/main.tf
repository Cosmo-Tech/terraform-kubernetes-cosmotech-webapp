terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.4.0"
    }
  }
}

# create webapp client
resource "keycloak_openid_client" "webapp-client" {
  realm_id  = var.realm_id
  client_id = var.realm_client_id
  name      = var.realm_client_name
  enabled   = true

  standard_flow_enabled    = true
  service_accounts_enabled = false
  access_type              = "PUBLIC"
  valid_redirect_uris = [
    "https://${var.api_dns_name}${var.realm_client_public_url}",
    "https://${var.api_dns_name}${var.realm_client_public_url}/*"
  ]

  login_theme = "keycloak"

  # Added parameters
  root_url                    = "https://${var.api_dns_name}${var.realm_client_public_url}"
  base_url                    = "https://${var.api_dns_name}${var.realm_client_public_url}"
  admin_url                   = "https://${var.api_dns_name}${var.realm_client_public_url}"
  web_origins                 = ["+"]
  full_scope_allowed          = true
  frontchannel_logout_enabled = true
}

resource "keycloak_generic_protocol_mapper" "branch_code_mapper" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.webapp-client.id
  name            = "BranchCodeMapper"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-attribute-mapper"
  config = {
    "aggregate.attrs" : "false",
    "multivalued" : "false",
    "userinfo.token.claim" : "true",
    "user.attribute" : "branch",
    "id.token.claim" : "false",
    "access.token.claim" : "true",
    "claim.name" : "branch",
    "jsonType.label" : "String"
  }
}

resource "keycloak_generic_protocol_mapper" "email_mapper" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.webapp-client.id
  name            = "email"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-property-mapper"
  config = {
    "user.attribute" : "email",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "claim.name" : "email",
    "jsonType.label" : "String",
    "userinfo.token.claim" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "realm_roles_mapper" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.webapp-client.id
  name            = "realm roles"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-realm-role-mapper"
  config = {
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "claim.name" : var.realm_client_roles_jwt_claim,
    "jsonType.label" : "String",
    "multivalued" : "true",
    "userinfo.token.claim" : "true"
  }
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = var.realm_id
  client_id = keycloak_openid_client.webapp-client.id
  default_scopes = [
    "web-origins",
    "acr",
    "roles",
    "profile",
    "basic",
    "email"
  ]
}

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = var.realm_id
  client_id = keycloak_openid_client.webapp-client.id
  optional_scopes = [
    "address",
    "phone",
    "offline_access",
    "microprofile-jwt",
  ]
}
