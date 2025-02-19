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