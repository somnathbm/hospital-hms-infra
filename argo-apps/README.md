# argo-apps

This contains the ArgoCD app for the deployment of the hospital-hms services. 
It uses the Argo App-of-apps admin pattern.

# 🧱 Layout

```
argo-apps
│   │   app-of-apps.yaml                # Argo app-of-apps root file
│   │   README.md
│   │
│   ├───dev                             # Individual Argo application
│   │       appointment-app.yaml
│   │       billing-app.yaml
│   │       opd-app.yaml
│   │
│   ├───prod
│   │       appointment-app.yaml
│   │       billing-app.yaml
│   │       opd-app.yaml
│   │
│   └───test
│           appointment-app.yaml
│           billing-app.yaml
│           opd-app.yaml
```