resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "cert-manager"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "kubectl_manifest" "clusterissuer_letsencrypt" {
  depends_on = [
    helm_release.cert_manager
  ]
  
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt
spec:
  acme:
    email: ${var.clusterissuer_letsencrypt_email}
    privateKeySecretRef:
      name: letsencrypt
    server: "https://acme-v02.api.letsencrypt.org/directory"
    solvers:
      - http01:
          ingress:
            class: nginx
  YAML
}
