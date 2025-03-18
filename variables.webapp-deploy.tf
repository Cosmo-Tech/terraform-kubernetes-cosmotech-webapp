variable "webapp_deploy_tekton" {
  type = bool
}

variable "tekton_helm_chart" {
  type = string
}

variable "tekton_helm_repository" {
  type = string
}

variable "tekton_chart_package_version" {
  type = string
}
variable "app_docker_secret" {
  type = string
}

variable "app_webhook_secret" {
  type = string
}

variable "app_ingress_type" {
  type = string
}

variable "app_ngrok_host" {
  type = string
}

variable "app_helm_chart_pull_type" {
  type = string
}

variable "tekton_deployment_name" {
  type = string
}

variable "cp_run_tests" {
  type = string
}

variable "cp_webapp_url" {
  type = string
}

variable "cp_webapp_revision" {
  type = string
}

variable "cp_keycloak_client_id" {
  type = string 
}

variable "cp_keycloak_client_secret" {
  type = string 
}