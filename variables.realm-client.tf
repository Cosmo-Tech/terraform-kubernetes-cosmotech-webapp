variable "realm_client_deploy" {
  type = bool
}
variable "realm_id" {
  type = string
}
variable "realm_client_id" {
  type = string
}
variable "realm_client_name" {
  type = string
}
variable "realm_client_public_url" {
  type = string
}
variable "realm_client_roles_jwt_claim" {
  type = string
}
variable "realm_client_access_type" {
  type = string
}
variable "realm_clien_valid_redirect_uris" {
  type = list(string)
}
variable "realm_client_root_url" {
  type = string
}
variable "realm_client_base_url" {
  type = string
}
variable "realm_client_admin_url" {
  type = string
}
variable "realm_client_web_origins" {
  type = list(string)
}
variable "realm_client_full_scope_allowed" {
  type = bool
}
variable "realm_client_frontchannel_logout_enabled" {
  type = bool
}
variable "realm_client_standard_flow_enabled" {
  type = bool
}
variable "realm_client_service_accounts_enabled" {
  type = bool
}