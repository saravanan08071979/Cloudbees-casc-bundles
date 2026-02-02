# Minimal example to create the casc-bundle-service-config secret.
# Integrate into your existing Terraform (providers/cluster auth not shown).

resource "kubernetes_secret" "casc_bundle_service_config" {
  metadata {
    name      = "casc-bundle-service-config"
    namespace = "cloudbees"
    labels = {
      app = "casc-bundle-service"
    }
  }

  type = "Opaque"

  data = {
    "service-configuration.yaml" = <<-EOT
connectors:
  - id: andromedaci-casc
    url: https://github.com/<org>/<repo>.git
    branch: main
    path: bundles/controllers
    webhookSecret: <your-webhook-secret>
    credential:
      credentialId: github-token
      type: reference

credentials:
  - credentialId: github-token
    type: token
    token: <your-github-token>
EOT
  }
}
