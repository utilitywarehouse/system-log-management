data "ignition_file" "config" {
  mode = 420
  path = "/etc/vector/vector-config.yaml"

  content {
    content = file("${path.module}/resources/vector-config.yaml")
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
