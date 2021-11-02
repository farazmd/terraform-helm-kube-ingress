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
    default         = "https://haproxy-ingress.github.io/charts"
}

variable "chart" {
    type            = string
    description     = "Chart name"
    default         = "haproxy-ingress"
}
variable "chart_version" {
    type            = string
    description     = "Chart version"
    default         = "0.13.4"
}
variable "deploy_name" {
    type            = string
    description     = "Chart deploy name"
    default         = "haproxy"
}

variable "service_type" {
    type            = string
    description     = "Type of service for ingress"
    default         = "NodePort"
}