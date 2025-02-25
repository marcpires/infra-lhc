resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "null_resource" "argo_install" {
  depends_on = [kubernetes_namespace.argocd]

  provisioner "local-exec" {
    command = <<EOT
      kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
      kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/applicationset/v0.4.1/manifests/install.yaml
      kubectl apply -n argocd -f ./applicationset.yaml
    EOT
  }
}

