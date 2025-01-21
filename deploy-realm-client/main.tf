terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.4.0"
    }
  }
}

resource "keycloak_openid_client" "realm-client" {
  realm_id  = var.realm_id
  client_id = var.realm_client_id
  name      = var.realm_client_name
  enabled   = true

  standard_flow_enabled    = var.realm_client_standard_flow_enabled
  service_accounts_enabled = var.realm_client_service_accounts_enabled
  access_type              = var.realm_client_access_type
  valid_redirect_uris      = var.realm_clien_valid_redirect_uris

  login_theme = "keycloak"

  # Added parameters
  root_url                    = var.realm_client_root_url
  base_url                    = var.realm_client_base_url
  admin_url                   = var.realm_client_admin_url
  web_origins                 = var.realm_client_web_origins
  full_scope_allowed          = var.realm_client_full_scope_allowed
  frontchannel_logout_enabled = var.realm_client_frontchannel_logout_enabled
}

resource "keycloak_generic_protocol_mapper" "branch_code_mapper" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.realm-client.id
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
    "jsonType.label" : "String",
    "introspection.token.claim" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "email_mapper" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.realm-client.id
  name            = "email"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-property-mapper"
  config = {
    "user.attribute" : "email",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "claim.name" : "email",
    "jsonType.label" : "String",
    "userinfo.token.claim" : "true",
    "introspection.token.claim" : "true"
  }
}

resource "keycloak_generic_protocol_mapper" "realm_roles_mapper" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.realm-client.id
  name            = "realm roles"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-usermodel-realm-role-mapper"
  config = {
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "claim.name" : var.realm_client_roles_jwt_claim,
    "jsonType.label" : "String",
    "multivalued" : "true",
    "userinfo.token.claim" : "true",
    "introspection.token.claim" : "true"
  }
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = var.realm_id
  client_id = keycloak_openid_client.realm-client.id
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
  client_id = keycloak_openid_client.realm-client.id
  optional_scopes = [
    "address",
    "phone",
    "offline_access",
    "microprofile-jwt",
  ]
}
