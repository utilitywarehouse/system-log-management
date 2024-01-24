data "ignition_file" "config" {
  mode = 420
  path = "/etc/promtail/promtail-config.yaml"

  content {
    content = file("${path.module}/resources/promtail-config.yaml")
  }
}

data "ignition_systemd_unit" "service" {
  name = "promtail.service"

  content = templatefile("${path.module}/resources/promtail.service",
    {
      promtail_image_url = var.promtail_image_url
      promtail_image_tag = var.promtail_image_tag
      log_cluster        = var.log_cluster
      log_machinerole    = var.log_machinerole
      loki_url           = var.loki_url
      loki_username      = var.loki_username
      loki_password      = var.loki_password
    }
  )
}
