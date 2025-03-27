provider "google" {
  project = "glossy-precinct-450612-g6"
  region  = "europe-north1"
}

module "network" {
  source       = "./network"
  network_name = "avl-network"
  subnet_name  = "avl-subnet"
  subnet_cidr  = "10.0.1.0/24"
  region       = "europe-north1"
}

resource "google_compute_instance" "ubuntu_ce" {
  name         = var.instance_name
  machine_type = "e2-micro"
  zone         = "europe-north1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
    }
  }

  metadata = {
    "startup-script" = file("${path.module}/user-data.sh")
    "ssh-keys"       = "${var.ssh_user}:${file("${path.module}/key-pub.pub")}"
  }

  tags = ["web-server", "ssh"]

  network_interface {
    network    = module.network.network_self_link
    subnetwork = module.network.subnet_self_link
    access_config {}
  }
}


