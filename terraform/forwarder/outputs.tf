output "unit" {
  value = data.ignition_systemd_unit.service.rendered
}

output "file" {
  value = data.ignition_file.systemd.rendered
}

output "metrics" {
  value = data.ignition_file.metrics.rendered
}
