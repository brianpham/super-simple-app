resource "kubernetes_deployment" "supersimpleapp" {
  metadata {
    name = "supersimpleapp"
    labels = {
      app = "supersimpleapp"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "supersimpleapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "supersimpleapp"
        }
      }
      spec {
        container {
          image = "ghcr.io/brianpham/supersimpleapp:de0846d"
          name  = "ssa"

          port {
            container_port = 8787
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "100Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          env {
            name = "ENV"
            value_from {
              config_map_key_ref {
                name = "supersimpleapp-configmap"
                key  = "ENV"
              }
            }
          }

          volume_mount {
            name       = "supersimpleapp-config"
            mount_path = "/usr/share/nginx/html"
          }
        }

        volume {
          name = "supersimpleapp-config"

          config_map {
            name = "supersimpleapp-configmap"
          }
        }
      }
    }
  }
}