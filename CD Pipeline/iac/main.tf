resource "kubernetes_deployment" "app" {
  metadata {
    name      = "calculator-app"
    namespace = var.namespace
    labels = {
      app = "calculator"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "calculator"
      }
    }

    template {
      metadata {
        labels = {
          app = "calculator"
        }
      }

      spec {
        container {
          name  = "calculator"
          image = var.image_tag

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "app" {
  metadata {
    name      = "calculator-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "calculator"
    }

    port {
      port        = 80
      target_port = 8080
      node_port   = var.node_port
    }

    type = "NodePort"
  }
}
