# Kubernetes manifests (no secrets committed)

This repo intentionally does NOT store real secrets.

Create/update the bundle service secret like this:

kubectl -n cloudbees create secret generic casc-bundle-service-config \
  --from-literal=username="YOUR_GITHUB_USERNAME" \
  --from-literal=token="YOUR_GITHUB_TOKEN" \
  --dry-run=client -o yaml | kubectl apply -f -
