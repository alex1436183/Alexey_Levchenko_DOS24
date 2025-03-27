resource "google_compute_network" "avl_vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "avl_subnet" {
  name          = var.subnet_name
  network       = google_compute_network.avl_vpc.self_link
  ip_cidr_range = var.subnet_cidr
  region        = var.region
}

resource "google_compute_firewall" "web_ssh" {
  name    = "${var.network_name}-allow-web-ssh"
  network = google_compute_network.avl_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server", "ssh"]
}

output "network_self_link" {
  value = google_compute_network.avl_vpc.self_link
}

output "subnet_self_link" {
  value = google_compute_subnetwork.avl_subnet.self_link
}
