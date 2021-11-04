resource "helm_release" "nginx" {
    # See https://github.com/kubernetes/ingress-nginx/tree/helm-chart-4.0.6/charts/ingress-nginx
    repository          = var.repository
    chart               = var.chart
    version             = var.chart_version
    name                = var.deploy_name
    create_namespace    = var.create_namespace
    namespace           = var.namespace

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