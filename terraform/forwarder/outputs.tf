output "unit" {
  value = data.ignition_systemd_unit.service.rendered
}

output "file" {
  value = data.ignition_file.config.rendered
}
