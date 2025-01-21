locals {
  pre_name  = "Cosmo Tech "
  post_name = " ${var.cluster_name} For ${var.kubernetes_tenant_namespace}"
  # Azure IDs
  microsoft_graph_resource_access_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph
  user_read_resource_access_id       = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # User.Read
  platform_resource_access_id        = "6332363e-bcba-4c4a-a605-c25f23117400" # platform
  application_access_role_id         = "bb49d61f-8b6a-4a19-b5bd-06a29d6b8e60" # role
  # URIs
  public_client_redirect_uri = "http://localhost:8484/"
  webapp_spa_redirect_uri    = "http://localhost:3000/scenario"
}

# Application powerbi
resource "azuread_application" "powerbi" {
  display_name     = "${local.pre_name}PowerBI${local.post_name}"
  sign_in_audience = "AzureADMyOrg"
}

resource "azuread_service_principal" "powerbi" {
  client_id                    = azuread_application.powerbi.client_id
  app_role_assignment_required = false
  depends_on                   = [azuread_application.powerbi]
}

resource "azuread_application_password" "powerbi_password" {
  display_name   = "powerbi_secret"
  application_id = azuread_application.powerbi.id
}

resource "kubernetes_secret" "powerbi" {
  metadata {
    name      = "${var.webapp_deployment_name}-powerbi-client"
    namespace = var.kubernetes_tenant_namespace
  }
  data = {
    "client_id"     = azuread_application.powerbi.client_id
    "client_secret" = azuread_application_password.powerbi_password.value
  }
}
