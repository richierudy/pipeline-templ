locals {
    files = {
        jenkins = "${path.module}/yaml/values.yaml.tpl"
    }
}

data "template_file" "jenkins"{
    template = file(local.files.jenkins)

    vars = {
        service_account_name = "jenkins"
    }
}

resource "kubernetes_namespace" "cicd" {
    count = var.enable_cicd ? 1 : 0

    metadata {
        name = "cicd"
    }
}



resource "kubernetes_namespace" "production" {
    count = var.enable_cicd ? 1 : 0

    metadata {
        name = "production"
    }


}

resource "kubernetes_namespace" "qa" {
    count = var.enable_cicd ? 1 : 0

    metadata {
        name = "qa"
    }
}

resource "kubernetes_namespace" "development" {
    count = var.enable_cicd ? 1 : 0

    metadata {
        name = "development"
    }
}

resource "helm_release" "jenkins" {
    count = var.enable_cicd ? 1 : 0

    name = "jenkins"
    chart = "jenkins"
    version = "2.6.3"
    namespace = kubernetes_namespace.cicd.0.metadata.0.name
    repository = "https://charts.jenkins.io"

    values = [
        data.template_file.jenkins.rendered
    ]
}

resource "kubernetes_cluster_role_binding" "jenkins" {

    count = var.enable_cicd ? 1 : 0

    metadata {
        name = "jenkins"
    }

    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind      = "ClusterRole"
        name      = "cluster-admin"
    }

    subject {
        kind      = "Group"
        name      = "default"
        api_group = "rbac.authorization.k8s.io"
        namespace = kubernetes_namespace.cicd.0.metadata.0.name
    }

     depends_on = [helm_release.jenkins]
}
