data "sops_file" "demo-secret" {
  source_file = "secret.tfvars.yaml"
  input_type  = "yaml"
}