resource "null_resource" "helm_repo_update" {
  provisioner "local-exec" {
    command = <<EOT
    helm repo add hashicorp https://helm.releases.hashicorp.com
    helm repo update
    EOT
  }
}

resource "helm_release" "argocd" {
  depends_on = [null_resource.helm_repo_update]

  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "7.3.11"

  values = [file("../../values/argocd.yaml")]
}