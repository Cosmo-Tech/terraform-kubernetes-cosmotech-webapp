variable "kubernetes_tenant_namespace" {
  description = "The namespace of the tenant"
  type        = string
}

variable "api_dns_name" {
  description = "The DNS name of the API"
  type        = string
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