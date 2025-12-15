resource "kubernetes_namespace" "env" {
  metadata {
    name = var.namespace
  }
}
