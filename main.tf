provider "local" {}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
