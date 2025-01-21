module "deploy-webapp-client" {
  source = "./deploy-webapp-client"

  count = var.realm_client_deploy ? 1 : 0

  kubernetes_tenant_namespace  = var.kubernetes_tenant_namespace
  realm_id                     = var.realm_id
  api_dns_name                 = var.api_dns_name
  realm_client_id              = var.realm_client_id
  realm_client_name            = var.realm_client_name
  realm_client_public_url      = var.realm_client_public_url
  realm_client_roles_jwt_claim = var.realm_client_roles_jwt_claim

}

module "deploy-webapp" {
  source = "./deploy-webapp"

  count = var.webapp_deploy ? 1 : 0

  api_dns_name                                   = var.api_dns_name
  keycloak_url                                   = var.keycloak_url
  kubernetes_tenant_namespace                    = var.kubernetes_tenant_namespace
  webapp_helm_chart_name                         = var.webapp_helm_chart_name
  webapp_helm_chart_repository                   = var.webapp_helm_chart_repository
  webapp_helm_chart_version                      = var.webapp_helm_chart_version
  webapp_image_repository_functions              = var.webapp_image_repository_functions
  webapp_image_repository_server                 = var.webapp_image_repository_server
  webapp_powerbi_app_client_id                   = var.webapp_powerbi_app_client_id
  webapp_powerbi_app_tenant_id                   = var.webapp_powerbi_app_tenant_id
  webapp_powerbi_app_secret                      = var.webapp_powerbi_app_secret
  webapp_deployment_name                         = var.webapp_deployment_name
  webapp_public_url                              = var.webapp_public_url
  webapp_cm_content_security                     = var.webapp_cm_content_security
  webapp_cm_global_app_registration_client_id    = var.webapp_cm_global_app_registration_client_id
  webapp_cm_global_auth_kecloak_client_id        = var.webapp_cm_global_auth_kecloak_client_id
  webapp_cm_global_auth_keycloak_realm           = var.webapp_cm_global_auth_keycloak_realm
  webapp_cm_global_auth_keycloak_roles_jwt_claim = var.webapp_cm_global_auth_keycloak_roles_jwt_claim
  webapp_cm_global_azure_tenant_id               = var.webapp_cm_global_azure_tenant_id
  webapp_cm_global_cosmotech_api_scope           = var.webapp_cm_global_cosmotech_api_scope
  webapp_cm_global_default_base_auth             = var.webapp_cm_global_default_base_auth
  webapp_cm_global_organization_id               = var.webapp_cm_global_organization_id
  webapp_cm_global_public_url                    = var.webapp_cm_global_public_url
  webapp_cm_global_workspaces_ids_filter         = var.webapp_cm_global_workspaces_ids_filter
  webapp_workspace_secret_csm_api_key            = var.webapp_workspace_secret_csm_api_key
  webapp_workspace_secret_csm_api_url            = var.webapp_workspace_secret_csm_api_url
  webapp_workspace_secret_csm_loki_url           = var.webapp_workspace_secret_csm_loki_url
  webapp_workspace_secret_csm_namespace_name     = var.webapp_workspace_secret_csm_namespace_name
  webapp_workspace_secret_postgres_db_name       = var.webapp_workspace_secret_postgres_db_name
  webapp_workspace_secret_postgres_host_uri      = var.webapp_workspace_secret_postgres_host_uri
  webapp_workspace_secret_postgres_user_password = var.webapp_workspace_secret_postgres_user_password
  webapp_workspace_secret_postgres_host_port     = var.webapp_workspace_secret_postgres_host_port
  webapp_workspace_secret_postgres_db_schema     = var.webapp_workspace_secret_postgres_db_schema
  webapp_workspace_secret_postgres_user_name     = var.webapp_workspace_secret_postgres_user_name
  api_organization_id                            = var.api_organization_id
  api_workspace_id                               = var.api_workspace_id
  webapp_powerbi_roles_jwt_claim                 = var.webapp_powerbi_roles_jwt_claim

  depends_on = [module.deploy-webapp-client]
}
