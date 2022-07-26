data "ignition_file" "config" {
  mode       = 420
  path       = "/etc/fluent/fluent.conf"

  content {
    content = file("${path.module}/resources/forwarder.conf")
  }
}

data "ignition_systemd_unit" "service" {
  name = "log-forwarder.service"

  content = templatefile("${path.module}/resources/forwarder.service",
    {
      fluentd_image_url   = var.fluentd_image_url
      fluentd_image_tag   = var.fluentd_image_tag
      aggregator_host     = var.aggregator_host
      aggregator_username = var.aggregator_username
      aggregator_password = var.aggregator_password
      log_cluster         = var.log_cluster
      log_machinerole     = var.log_machinerole
    }
  )
}
