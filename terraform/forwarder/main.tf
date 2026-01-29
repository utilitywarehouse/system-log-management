data "ignition_file" "systemd" {
  mode = 420
  path = "/etc/vector/systemd.yaml"

  content {
    content = file("${path.module}/resources/vector-systemd.yaml")
  }
}

data "ignition_file" "metrics" {
  mode = 420
  path = "/etc/vector/metrics.yaml"

  content {
    content = file("${path.module}/resources/vector-metrics.yaml")
  }
}

data "ignition_systemd_unit" "service" {
  name = "vector.service"

  content = templatefile("${path.module}/resources/vector.service",
    {
      vector_image_url = var.vector_image_url
      vector_image_tag = var.vector_image_tag
      log_cluster      = var.log_cluster
      log_machinerole  = var.log_machinerole
      loki_url         = var.loki_url
      loki_username    = var.loki_username
      loki_password    = var.loki_password
    }
  )
}
