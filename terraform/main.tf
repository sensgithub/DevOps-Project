provider "kubernetes" {
  config_path = "/home/sens/.kube/config"
}

resource "kubernetes_deployment" "prometheus" {
  metadata {
    name = "prometheus"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "prometheus"
      }
    }

    template {
      metadata {
        labels = {
          app = "prometheus"
        }
      }

      spec {
        container {
          name  = "prometheus"
          image = "prom/prometheus:v2.29.2"

          port {
            container_port = 9090
          }

          args = [
            "--config.file=/etc/prometheus/prometheus.yml",
            "--storage.tsdb.path=/prometheus",
          ]

          volume_mount {
            name      = "config-volume"
            mount_path = "/etc/prometheus"
          }

          volume_mount {
            name      = "prometheus-data"
            mount_path = "/prometheus"
          }
        }

        volume {
          name = "config-volume"

          config_map {
            name = kubernetes_config_map.prometheus.metadata[0].name
          }
        }

        volume {
          name = "prometheus-data"

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.prometheus-claim.metadata[0].name
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "prometheus" {
  metadata {
    name = "prometheus"
  }

  spec {
    selector = {
      app = "prometheus"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 9090
    }

    type = "NodePort"
  }
}

resource "kubernetes_config_map" "prometheus" {
  metadata {
    name = "prometheus-config"
  }

  data = {
    "prometheus.yml" = <<-EOF
global:
  scrape_interval:      15s
  evaluation_interval:  15s

scrape_configs:

  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']   
EOF
  }
}

resource "kubernetes_persistent_volume_claim" "prometheus-claim" {
  metadata {
    name = "prometheus-pv"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}

resource "kubernetes_deployment" "grafana" {
  metadata {
    name = "grafana"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "grafana"
      }
    }

    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }

      spec {
        container {
          name  = "grafana"
          image = "grafana/grafana:8.1.5"

          port {
            container_port = 3000
          }

          env {
            name  = "GF_INSTALL_PLUGINS"
            value = "grafana-piechart-panel,grafana-polystat-panel"
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "grafana" {
  metadata {
    name = "grafana"
  }

  spec {
    selector = {
      app = "grafana"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 3000
    }

    type        = "NodePort"
    session_affinity = "None"
  }
}
