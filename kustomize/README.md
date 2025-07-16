# Kustomize

This is where all Kustomize specific configs belongs. It uses both Kustomize + Helm charts together.
Note - The Helm charts need to be published. In this repo, the charts are published to `gh-pages` branch and served from there.

---
# Layout

```
├───kustomize
│   ├───base                                    # Base
│   └───overlays                                # Environment overlays
│       ├───dev
│       │    ├─── opd                           # OPD service overlay
│       │    │      ├─── kustomization.yaml     # dev/opd specific overlay kustomization
│       │    │      ├─── opd-values.yaml        # value override file
│       │    │      ├─── namespace.yaml         # namespace specific to dev
│       │    ├─── billing                       # Billing service overlay
│       ├───prod
│       └───test
```
---