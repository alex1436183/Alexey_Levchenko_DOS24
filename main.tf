﻿terraform {
  required_providers {
    virtualbox = {
      source = "shekeriev/virtualbox"
      version = "0.0.4"
    }
  }
}

provider "virtualbox" {
  delay      = 60
  mintimeout = 5
}

resource "virtualbox_vm" "vm1" {
  name   = "Ubuntu"
  image  = "./ubuntu-118.box"
  cpus      = 2
  memory    = "1024 mib"
  #user_data = file("${path.module}/user_data.yaml")
   

  network_adapter {
    type           = "hostonly"
    device         = "IntelPro1000MTDesktop"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}

output "IPAddress" {
  value = element(virtualbox_vm.vm1.*.network_adapter.0.ipv4_address, 1)
}