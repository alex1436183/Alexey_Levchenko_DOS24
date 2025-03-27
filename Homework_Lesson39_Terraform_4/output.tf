output "External-IP" {
  value = google_compute_instance.ubuntu_ce.network_interface[0].access_config[0].nat_ip
}

output "User" {
  value = var.ssh_user
}
