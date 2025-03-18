locals {
  keycloak_url_auth            = "${var.keycloak_url}/realms/${var.kubernetes_tenant_namespace}"
  webapp_helm_release_name     = "${var.webapp_deployment_name}-${var.kubernetes_tenant_namespace}"
  tekton_helm_release_name     = "${var.tekton_deployment_name}-${var.kubernetes_tenant_namespace}"
  webapp_powerbi_app_client_id = var.webapp_powerbi_app_client_id == "" ? data.kubernetes_secret.powerbi.data.client_id : var.webapp_powerbi_app_client_id
  webapp_powerbi_app_secret    = var.webapp_powerbi_app_secret == "" ? data.kubernetes_secret.powerbi.data.client_secret : var.webapp_powerbi_app_secret
  webapp_variables = {
    "WEBAPP_DEPLOYMENT_NAME"               = var.webapp_deployment_name
    "API_DNS_NAME"                         = var.api_dns_name
    "WEBAPP_PUBLIC_URL"                    = var.webapp_public_url
    "IMAGE_REPOSITORY_SERVER"              = var.webapp_image_repository_server
    "IMAGE_REPOSITORY_FUNCTIONS"           = var.webapp_image_repository_functions
    "KEYCLOAK_URL_AUTH"                    = local.keycloak_url_auth
    "POWERBI_APP_TENANT_ID"                = var.webapp_powerbi_app_tenant_id
    "POWERBI_APP_CLIENT_ID"                = local.webapp_powerbi_app_client_id
    "POWERBI_APP_SECRET"                   = local.webapp_powerbi_app_secret
    "WEBHOOK_SECRET"                       = var.wehbook_secret
    "DOCKER_SECRET"                        = var.docker_secret
    "INGRESS_TYPE"                         = var.ingress_type
    "NGROK_HOST"                           = var.ngrok_host
    "HELM_CHART_PULL_TYPE"                 = var.helm_chart_pull_type
    "WEBAPP_CHART_VERSION"                 = var.webapp_helm_chart_version
    "CP_AUTH_KEYCLOAK_CLIENT_ID"           = var.cp_keycloak_client_id
    "CP_AUTH_KEYCLOACK_CLIENT_SECRET"      = var.cp_keycloak_client_secret
    "CP_WEBAPP_URL"                        = var.cp_webapp_url
    "CP_WEBAPP_REVISION"                   = var.cp_webapp_revision
    "CP_RUN_TESTS"                         = var.cp_run_tests

  }

  cm_data_global = {
    "APP_REGISTRATION_CLIENT_ID"           = var.webapp_cm_global_app_registration_client_id
    "AUTH_KEYCLOAK_CLIENT_ID"              = var.webapp_cm_global_auth_kecloak_client_id
    "AUTH_KEYCLOAK_REALM"                  = var.webapp_cm_global_auth_keycloak_realm
    "AUTH_KEYCLOAK_ROLES_JWT_CLAIM"        = var.webapp_cm_global_auth_keycloak_roles_jwt_claim
    "AZURE_TENANT_ID"                      = var.webapp_cm_global_azure_tenant_id
    "COSMOTECH_API_SCOPE"                  = var.webapp_cm_global_cosmotech_api_scope
    "DEFAULT_BASE_PATH"                    = var.webapp_cm_global_default_base_auth
    "ORGANIZATION_ID"                      = var.webapp_cm_global_organization_id
    "PUBLIC_URL"                           = var.webapp_cm_global_public_url
    "WORKSPACES_IDS_FILTER"                = var.webapp_cm_global_workspaces_ids_filter
  }
}

data "kubernetes_secret" "powerbi" {
  metadata {
    name      = "${var.webapp_deployment_name}-powerbi-client"
    namespace = var.kubernetes_tenant_namespace
  }
}

resource "kubernetes_config_map" "config" {
  metadata {
    name      = "${var.webapp_deployment_name}-server-configmap-config"
    namespace = var.kubernetes_tenant_namespace
  }
  data = {
    "AssetCopyMapping.json"      = file("${path.module}/config/assets.json")
    "ContentSecurityPolicy.json" = file("${path.module}/config/security.json")
    "GlobalConfiguration.json"   = templatefile("${path.module}/config/global.json", local.cm_data_global)
  }
}

resource "kubernetes_secret" "workspaces" {
  count = var.api_organization_id != "" && var.api_workspace_id != "" ? 1 : 0
  metadata {
    name      = "${var.api_organization_id}-${var.api_workspace_id}"
    namespace = var.kubernetes_tenant_namespace
  }

  data = {
    "CSM_API_KEY"            = var.webapp_workspace_secret_csm_api_key
    "CSM_API_URL"            = var.webapp_workspace_secret_csm_api_url
    "CSM_LOKI_URL"           = var.webapp_workspace_secret_csm_loki_url
    "CSM_NAMESPACE_NAME"     = var.webapp_workspace_secret_csm_namespace_name
    "POSTGRES_DB_NAME"       = var.webapp_workspace_secret_postgres_db_name
    "POSTGRES_HOST_URI"      = var.webapp_workspace_secret_postgres_host_uri
    "POSTGRES_USER_PASSWORD" = var.webapp_workspace_secret_postgres_user_password
    "POSTGRES_HOST_PORT"     = var.webapp_workspace_secret_postgres_host_port
    "POSTGRES_DB_SCHEMA"     = var.webapp_workspace_secret_postgres_db_schema
    "POSTGRES_USER_NAME"     = var.webapp_workspace_secret_postgres_user_name
  }
}

resource "helm_release" "csm-webapp-deployment" {
  name         = local.tekton_helm_release_name
  namespace    = var.kubernetes_tenant_namespace
  repository   = var.tekton_helm_chart_repository
  chart        = var.tekton_helm_chart_name
  version      = var.tekton_helm_chart_version
  reset_values = true
  timeout      = 300
  values       = [templatefile("${path.module}/values.yaml", local.webapp_variables)]

  depends_on = [
    kubernetes_config_map.config,
    kubernetes_secret.workspaces,
  ]
}
