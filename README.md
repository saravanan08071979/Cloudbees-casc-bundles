# CloudBees CI – CasC Bundles (Self‑Contained Per Controller)

This repository is a starter scaffold for **per-controller** CloudBees CI CasC bundles, designed to work well with the **CasC Controller Bundle Service**.

## Layout

- `bundles/controllers/<controller>/` — one folder per managed controller bundle
  - `bundle.yaml` — bundle descriptor (id/version/etc.)
  - `jenkins.yaml` — controller configuration (JCasC)
  - `items.yaml` — optional items to create on the controller
  - `variables.yaml` — bundle variables (used via ${...} placeholders)

## Quick start

1) Copy this structure into your Git repo and commit.
2) Enable CasC Controller Bundle Service in your CloudBees Helm values (CJOC).
3) Create/update the `casc-bundle-service-config` secret to point a connector at this repo **path**:
   - recommended: `path: bundles/controllers`
4) In CJOC: create `mc1` and `mc2` managed controllers and set:
   - **Configuration as Code (CasC) → CasC Bundles From CasC Bundle Service**
   - choose bundle `mc1` for controller `mc1`, bundle `mc2` for controller `mc2`
5) Provision/restart the controllers so the bundle applies.

## Notes

- The CasC Controller Bundle Service does **not** support bundle inheritance (`parent`) or bundle availability (`availabilityPattern`) in `bundle.yaml`.
- Keep each bundle folder clean: only include bundle files (bundle.yaml, jenkins.yaml, items.yaml, rbac.yaml, variables.yaml, plugins/catalog if used).
