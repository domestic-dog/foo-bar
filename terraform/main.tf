resource "yandex_compute_instance" "v1" {
  for_each = toset([ "postgresql-1","postgresql-2" ])
  name                      = "${var.prefix}-${each.key}"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 50
  }

  boot_disk {
    initialize_params {
      image_id = "fd8tf1sepeiku6d37l4l"
    }
  }

  network_interface {
    subnet_id = data.sops_file.demo-secret.data["subnet_id"]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("cloudinit/cloudinit.yaml")}"
  }
  scheduling_policy {
    preemptible = true
  }
}




