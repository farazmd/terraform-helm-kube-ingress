# See https://registry.terraform.io/providers/hashicorp/helm/2.3.0/docs
resource "helm_release" "haproxy" {
    # See https://github.com/haproxy-ingress/charts/tree/release-0.13/haproxy-ingress
    repository  = var.repository
    chart       = var.chart
    version     = var.chart_version
    name        = var.deploy_name
    create_namespace = var.create_namespace
    namespace   = var.namespace
    values      = [file("./values.yaml")]

    set {
        name    = "controller.service.type"
        value   = var.service_type
    }
}

data "kubernetes_service" "lb_service" {
    metadata {
        name        = "${var.deploy_name}-${var.chart}"
        namespace   = var.namespace
    }
}

locals {
    lb = var.service_type == "LoadBalancer" ? data.kubernetes_service.lb_service.status.0.load_balancer.0.ingress.0 : "Controller Service type is ${var.service_type}."
}