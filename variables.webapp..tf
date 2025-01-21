variable "webapp_deploy" {
  type = bool
}
variable "webapp_helm_chart_repository" {
  type = string
}
variable "webapp_helm_chart_name" {
  type = string
}
variable "webapp_helm_chart_version" {
  type = string
}
variable "webapp_deployment_name" {
  type = string
}
variable "webapp_public_url" {
  type = string
}
variable "webapp_image_repository_server" {
  type = string
}
variable "webapp_image_repository_functions" {
  type = string
}
variable "webapp_powerbi_app_tenant_id" {
  type = string
}
variable "webapp_powerbi_app_client_id" {
  type = string
}
variable "webapp_powerbi_app_secret" {
  type = string
}

variable "webapp_cm_content_security" {
  type = list(string)
}
variable "webapp_cm_global_app_registration_client_id" {
  type = string
}
variable "webapp_cm_global_auth_kecloak_client_id" {
  type = string
}
variable "webapp_cm_global_auth_keycloak_realm" {
  type = string
}
variable "webapp_cm_global_auth_keycloak_roles_jwt_claim" {
  type = string
}
variable "webapp_cm_global_azure_tenant_id" {
  type = string
}
variable "webapp_cm_global_cosmotech_api_scope" {
  type = string
}
variable "webapp_cm_global_default_base_auth" {
  type = string
}
variable "webapp_cm_global_organization_id" {
  type = string
}
variable "webapp_cm_global_public_url" {
  type = string
}
variable "webapp_cm_global_workspaces_ids_filter" {
  type = list(string)
}

variable "webapp_workspace_secret_csm_api_key" {
  type = string
}
variable "webapp_workspace_secret_csm_api_url" {
  type = string
}
variable "webapp_workspace_secret_csm_loki_url" {
  type = string
}
variable "webapp_workspace_secret_csm_namespace_name" {
  type = string
}
variable "webapp_workspace_secret_postgres_db_name" {
  type = string
}
variable "webapp_workspace_secret_postgres_host_uri" {
  type = string
}
variable "webapp_workspace_secret_postgres_user_password" {
  type = string
}
variable "webapp_workspace_secret_postgres_host_port" {
  type = string
}
variable "webapp_workspace_secret_postgres_db_schema" {
  type = string
}
variable "webapp_workspace_secret_postgres_user_name" {
  type = string
}
variable "webapp_powerbi_roles_jwt_claim" {
  type = string
}
variable "api_organization_id" {
  type = string
}
variable "api_workspace_id" {
  type = string
}
