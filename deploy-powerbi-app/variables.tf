variable "azure_tenant_id" {
  type        = string
}
variable "azure_subscription_id" {
  type = string
}
variable "azure_client_id" {
  type        = string
}
variable "azure_client_secret" {
  type        = string
}
variable "audience" {
  description = "The App Registration audience type"
  type        = string
  validation {
    condition = contains([
      "AzureADMyOrg",
      "AzureADMultipleOrgs"
    ], var.audience)
    error_message = "Only AzureADMyOrg and AzureADMultipleOrgs are supported for audience."
  }
}
variable "kubernetes_tenant_namespace" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "webapp_deployment_name" {
  type = string
}