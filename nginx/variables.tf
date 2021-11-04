variable "create_namespace" {
    type            = bool
    description     = "Create namespace ?"
    default         = true
}

variable "namespace" {
    type            = string
    description     = "Namespace to deploy the chart in." 
    default         = "ingress-controller"
}

variable "repository" {
    type            = string
    description     = "Chart repository url"
    default         = "https://kubernetes.github.io/ingress-nginx"
}

variable "chart" {
    type            = string
    description     = "Chart name"
    default         = "ingress-nginx"
}
variable "chart_version" {
    type            = string
    description     = "Chart version"
    default         = "4.0.6"
}
variable "deploy_name" {
    type            = string
    description     = "Chart deploy name"
    default         = "nginx"
}

variable "service_type" {
    type            = string
    description     = "Type of service for ingress"
    default         = "LoadBalancer"
}

variable "config_path" {
    type            = string
    description     = "Path to kube config"
}

variable "config_context" {
    type            = string
    description     = "Kubernetes context to use"
}