# kubernetes
kube_config                 = ""
kube_context                = ""
kubernetes_tenant_namespace = ""

# app powerbi
app_deploy            = true
azure_client_id       = ""
azure_client_secret   = ""
azure_tenant_id       = ""
azure_subscription_id = ""
audience              = "AzureADMyOrg"
cluster_name          = ""

# webapp
webapp_deploy                = true
webapp_helm_chart_repository = "https://cosmo-tech.github.io/helm-charts/"
webapp_helm_chart_name       = "cosmotech-business-webapp"
webapp_helm_chart_version    = ""

# realm client
realm_client_deploy          = true
realm_id                     = ""
realm_client_id              = ""
realm_client_name            = ""
realm_client_public_url      = ""
realm_client_roles_jwt_claim = "customRoles"
realm_client_access_type     = "PUBLIC"
realm_clien_valid_redirect_uris = [
  ""
]
realm_client_web_origins                 = ["+"]
realm_client_root_url                    = ""
realm_client_admin_url                   = ""
realm_client_base_url                    = ""
realm_client_standard_flow_enabled       = false
realm_client_frontchannel_logout_enabled = false
realm_client_service_accounts_enabled    = false
realm_client_full_scope_allowed          = false

# keycloak
keycloak_client_id     = ""
keycloak_client_secret = ""
keycloak_username      = ""
keycloak_password      = ""
keycloak_url           = ""

api_dns_name                      = "kubernetes.cosmotech.com"
webapp_public_url                 = ""
webapp_deployment_name            = "business-webapp"
webapp_image_repository_server    = "ghcr.io/cosmo-tech/azure-sample-webapp/webapp-server"
webapp_image_repository_functions = "ghcr.io/cosmo-tech/azure-sample-webapp/webapp-functions"
webapp_powerbi_app_tenant_id      = ""
webapp_powerbi_app_client_id      = ""
webapp_powerbi_app_secret         = ""
webapp_powerbi_roles_jwt_claim    = "customRoles"
# powerbi function

# content security config
webapp_cm_content_security = [
  "*.api.cosmotech.com",
  "https://kubernetes.cosmotech.com"
]
# content global config
webapp_cm_global_app_registration_client_id    = ""
webapp_cm_global_auth_kecloak_client_id        = ""
webapp_cm_global_auth_keycloak_realm           = ""
webapp_cm_global_auth_keycloak_roles_jwt_claim = "customRoles"
webapp_cm_global_azure_tenant_id               = ""
webapp_cm_global_cosmotech_api_scope           = "https://kubernetes.cosmotech.com/platform"
webapp_cm_global_default_base_auth             = ""
webapp_cm_global_organization_id               = ""
webapp_cm_global_public_url                    = ""
webapp_cm_global_workspaces_ids_filter         = [""]

# workspace secret
api_organization_id                            = ""
api_workspace_id                               = ""
webapp_workspace_secret_csm_api_key            = ""
webapp_workspace_secret_csm_api_url            = ""
webapp_workspace_secret_csm_loki_url           = ""
webapp_workspace_secret_csm_namespace_name     = ""
webapp_workspace_secret_postgres_db_name       = ""
webapp_workspace_secret_postgres_db_schema     = ""
webapp_workspace_secret_postgres_host_port     = ""
webapp_workspace_secret_postgres_host_uri      = ""
webapp_workspace_secret_postgres_user_name     = ""
webapp_workspace_secret_postgres_user_password = ""

#APP Deployment
tekton_helm_chart            = "api-deployment"
tekton_helm_repository       = "https://cosmo-tech.github.io/tekton/"
tekton_deployment_name       = "cosmotech-business-webapp-deployment"
tekton_chart_package_version = "0.1.26"
app_docker_secret            = ""
app_webhook_secret           = ""
app_ingress_type             = ""
app_ngrok_host               = ""
app_helm_chart_pull_type     = ""
cp_run_tests                 = "true"
cp_webapp_url                = "https://github.com/Cosmo-Tech/azure-sample-webapp.git"
cp_webapp_revision           = "tekton-cypress-tests"
cp_keycloak_client_id        = "cosmotech-webapp-cypress-service-account"
cp_keycloak_client_secret    = ""
