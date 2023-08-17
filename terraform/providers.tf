provider "yandex" {
  folder_id = data.sops_file.demo-secret.data["folder_id"]
  cloud_id  = data.sops_file.demo-secret.data["cloud_id"]
  token     = var.token
}
provider "sops" {}