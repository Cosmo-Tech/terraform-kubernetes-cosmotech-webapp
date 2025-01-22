<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>4.1.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.17.0 |
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | 4.4.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 2.0.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_deploy-powerbi-app"></a> [deploy-powerbi-app](#module\_deploy-powerbi-app) | ./deploy-powerbi-app | n/a |
| <a name="module_deploy-realm-client"></a> [deploy-realm-client](#module\_deploy-realm-client) | ./deploy-realm-client | n/a |
| <a name="module_deploy-webapp"></a> [deploy-webapp](#module\_deploy-webapp) | ./deploy-webapp | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_dns_name"></a> [api\_dns\_name](#input\_api\_dns\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_organization_id"></a> [api\_organization\_id](#input\_api\_organization\_id) | n/a | `string` | n/a | yes |
| <a name="input_api_workspace_id"></a> [api\_workspace\_id](#input\_api\_workspace\_id) | n/a | `string` | n/a | yes |
| <a name="input_app_deploy"></a> [app\_deploy](#input\_app\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_audience"></a> [audience](#input\_audience) | The App Registration audience type | `string` | n/a | yes |
| <a name="input_azure_client_id"></a> [azure\_client\_id](#input\_azure\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_azure_client_secret"></a> [azure\_client\_secret](#input\_azure\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_azure_tenant_id"></a> [azure\_tenant\_id](#input\_azure\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_client_id"></a> [keycloak\_client\_id](#input\_keycloak\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_client_secret"></a> [keycloak\_client\_secret](#input\_keycloak\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_password"></a> [keycloak\_password](#input\_keycloak\_password) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_url"></a> [keycloak\_url](#input\_keycloak\_url) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_username"></a> [keycloak\_username](#input\_keycloak\_username) | n/a | `string` | n/a | yes |
| <a name="input_kube_config"></a> [kube\_config](#input\_kube\_config) | n/a | `string` | n/a | yes |
| <a name="input_kube_context"></a> [kube\_context](#input\_kube\_context) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_tenant_namespace"></a> [kubernetes\_tenant\_namespace](#input\_kubernetes\_tenant\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_realm_clien_valid_redirect_uris"></a> [realm\_clien\_valid\_redirect\_uris](#input\_realm\_clien\_valid\_redirect\_uris) | n/a | `list(string)` | n/a | yes |
| <a name="input_realm_client_access_type"></a> [realm\_client\_access\_type](#input\_realm\_client\_access\_type) | n/a | `string` | n/a | yes |
| <a name="input_realm_client_admin_url"></a> [realm\_client\_admin\_url](#input\_realm\_client\_admin\_url) | n/a | `string` | n/a | yes |
| <a name="input_realm_client_base_url"></a> [realm\_client\_base\_url](#input\_realm\_client\_base\_url) | n/a | `string` | n/a | yes |
| <a name="input_realm_client_deploy"></a> [realm\_client\_deploy](#input\_realm\_client\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_realm_client_frontchannel_logout_enabled"></a> [realm\_client\_frontchannel\_logout\_enabled](#input\_realm\_client\_frontchannel\_logout\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_realm_client_full_scope_allowed"></a> [realm\_client\_full\_scope\_allowed](#input\_realm\_client\_full\_scope\_allowed) | n/a | `bool` | n/a | yes |
| <a name="input_realm_client_id"></a> [realm\_client\_id](#input\_realm\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_realm_client_name"></a> [realm\_client\_name](#input\_realm\_client\_name) | n/a | `string` | n/a | yes |
| <a name="input_realm_client_public_url"></a> [realm\_client\_public\_url](#input\_realm\_client\_public\_url) | n/a | `string` | n/a | yes |
| <a name="input_realm_client_roles_jwt_claim"></a> [realm\_client\_roles\_jwt\_claim](#input\_realm\_client\_roles\_jwt\_claim) | n/a | `string` | n/a | yes |
| <a name="input_realm_client_root_url"></a> [realm\_client\_root\_url](#input\_realm\_client\_root\_url) | n/a | `string` | n/a | yes |
| <a name="input_realm_client_service_accounts_enabled"></a> [realm\_client\_service\_accounts\_enabled](#input\_realm\_client\_service\_accounts\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_realm_client_standard_flow_enabled"></a> [realm\_client\_standard\_flow\_enabled](#input\_realm\_client\_standard\_flow\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_realm_client_web_origins"></a> [realm\_client\_web\_origins](#input\_realm\_client\_web\_origins) | n/a | `list(string)` | n/a | yes |
| <a name="input_realm_id"></a> [realm\_id](#input\_realm\_id) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_content_security"></a> [webapp\_cm\_content\_security](#input\_webapp\_cm\_content\_security) | n/a | `list(string)` | n/a | yes |
| <a name="input_webapp_cm_global_app_registration_client_id"></a> [webapp\_cm\_global\_app\_registration\_client\_id](#input\_webapp\_cm\_global\_app\_registration\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_global_auth_kecloak_client_id"></a> [webapp\_cm\_global\_auth\_kecloak\_client\_id](#input\_webapp\_cm\_global\_auth\_kecloak\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_global_auth_keycloak_realm"></a> [webapp\_cm\_global\_auth\_keycloak\_realm](#input\_webapp\_cm\_global\_auth\_keycloak\_realm) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_global_auth_keycloak_roles_jwt_claim"></a> [webapp\_cm\_global\_auth\_keycloak\_roles\_jwt\_claim](#input\_webapp\_cm\_global\_auth\_keycloak\_roles\_jwt\_claim) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_global_azure_tenant_id"></a> [webapp\_cm\_global\_azure\_tenant\_id](#input\_webapp\_cm\_global\_azure\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_global_cosmotech_api_scope"></a> [webapp\_cm\_global\_cosmotech\_api\_scope](#input\_webapp\_cm\_global\_cosmotech\_api\_scope) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_global_default_base_auth"></a> [webapp\_cm\_global\_default\_base\_auth](#input\_webapp\_cm\_global\_default\_base\_auth) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_global_organization_id"></a> [webapp\_cm\_global\_organization\_id](#input\_webapp\_cm\_global\_organization\_id) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_global_public_url"></a> [webapp\_cm\_global\_public\_url](#input\_webapp\_cm\_global\_public\_url) | n/a | `string` | n/a | yes |
| <a name="input_webapp_cm_global_workspaces_ids_filter"></a> [webapp\_cm\_global\_workspaces\_ids\_filter](#input\_webapp\_cm\_global\_workspaces\_ids\_filter) | n/a | `list(string)` | n/a | yes |
| <a name="input_webapp_deploy"></a> [webapp\_deploy](#input\_webapp\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_webapp_deployment_name"></a> [webapp\_deployment\_name](#input\_webapp\_deployment\_name) | n/a | `string` | n/a | yes |
| <a name="input_webapp_helm_chart_name"></a> [webapp\_helm\_chart\_name](#input\_webapp\_helm\_chart\_name) | n/a | `string` | n/a | yes |
| <a name="input_webapp_helm_chart_repository"></a> [webapp\_helm\_chart\_repository](#input\_webapp\_helm\_chart\_repository) | n/a | `string` | n/a | yes |
| <a name="input_webapp_helm_chart_version"></a> [webapp\_helm\_chart\_version](#input\_webapp\_helm\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_webapp_image_repository_functions"></a> [webapp\_image\_repository\_functions](#input\_webapp\_image\_repository\_functions) | n/a | `string` | n/a | yes |
| <a name="input_webapp_image_repository_server"></a> [webapp\_image\_repository\_server](#input\_webapp\_image\_repository\_server) | n/a | `string` | n/a | yes |
| <a name="input_webapp_powerbi_app_client_id"></a> [webapp\_powerbi\_app\_client\_id](#input\_webapp\_powerbi\_app\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_webapp_powerbi_app_secret"></a> [webapp\_powerbi\_app\_secret](#input\_webapp\_powerbi\_app\_secret) | n/a | `string` | n/a | yes |
| <a name="input_webapp_powerbi_app_tenant_id"></a> [webapp\_powerbi\_app\_tenant\_id](#input\_webapp\_powerbi\_app\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_webapp_powerbi_roles_jwt_claim"></a> [webapp\_powerbi\_roles\_jwt\_claim](#input\_webapp\_powerbi\_roles\_jwt\_claim) | n/a | `string` | n/a | yes |
| <a name="input_webapp_public_url"></a> [webapp\_public\_url](#input\_webapp\_public\_url) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_csm_api_key"></a> [webapp\_workspace\_secret\_csm\_api\_key](#input\_webapp\_workspace\_secret\_csm\_api\_key) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_csm_api_url"></a> [webapp\_workspace\_secret\_csm\_api\_url](#input\_webapp\_workspace\_secret\_csm\_api\_url) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_csm_loki_url"></a> [webapp\_workspace\_secret\_csm\_loki\_url](#input\_webapp\_workspace\_secret\_csm\_loki\_url) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_csm_namespace_name"></a> [webapp\_workspace\_secret\_csm\_namespace\_name](#input\_webapp\_workspace\_secret\_csm\_namespace\_name) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_postgres_db_name"></a> [webapp\_workspace\_secret\_postgres\_db\_name](#input\_webapp\_workspace\_secret\_postgres\_db\_name) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_postgres_db_schema"></a> [webapp\_workspace\_secret\_postgres\_db\_schema](#input\_webapp\_workspace\_secret\_postgres\_db\_schema) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_postgres_host_port"></a> [webapp\_workspace\_secret\_postgres\_host\_port](#input\_webapp\_workspace\_secret\_postgres\_host\_port) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_postgres_host_uri"></a> [webapp\_workspace\_secret\_postgres\_host\_uri](#input\_webapp\_workspace\_secret\_postgres\_host\_uri) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_postgres_user_name"></a> [webapp\_workspace\_secret\_postgres\_user\_name](#input\_webapp\_workspace\_secret\_postgres\_user\_name) | n/a | `string` | n/a | yes |
| <a name="input_webapp_workspace_secret_postgres_user_password"></a> [webapp\_workspace\_secret\_postgres\_user\_password](#input\_webapp\_workspace\_secret\_postgres\_user\_password) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->