resource "kubernetes_config_map" "supersimpleapp-configmap" {
  metadata {
    name = "supersimpleapp-configmap"
  }

  data = {
    "index.html"  = file("../../../${path.module}/static-app/static/index.html")
    "config.html" = file("../../../${path.module}/static-app/static/config.html")
    "page1.html"  = file("../../../${path.module}/static-app/static/page1.html")
    "error.html"  = file("../../../${path.module}/static-app/static/error.html")
    ENV           = "dev"
  }

}