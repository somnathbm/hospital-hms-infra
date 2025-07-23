#!/bin/bash

set -e

# Create `/templates` directory
mkdir -p templates

# Export the raw templates in `/templates`
helm template my-opd-svc ./charts/opd-service -f ./kustomize/overlays/dev/opd/opd-values.yaml > ./templates/opd-service.yaml
helm template my-billing-svc ./charts/billing-service -f ./kustomize/overlays/dev/billing/billing-values.yaml > ./templates/billing-service.yaml
helm template my-appointment-svc ./charts/appointment-service -f ./kustomize/overlays/dev/appointment/appointment-values.yaml > ./templates/appointment-service.yaml

# Generate the namespace.yaml file in `/templates`
cat >./templates/namespace.yaml <<EOF
  apiVersion: v1
  kind: Namespace
  metadata:
    name: hospital-dev
EOF

# Generate the Kustomization.yaml file in `/templates`
cat >./templates/kustomization.yaml << EOF
  apiVersion: kustomize.config.k8s.io/v1beta1
  kind: Kustomization
  namespace: hospital-dev

  resources:
    - namespace.yaml
    - opd-service.yaml
    - billing-service.yaml
    - appointment-service.yaml
EOF

# Check existance of `/templates/kustomization.yaml` file
if [[ ! -f "./templates/kustomization.yaml" ]]; then
  echo "kustomization.yaml file does not exist. Cannot continue."
  exit 1
else
  # apply the kustomization.yaml
  # kubectl apply -k ./templates
  echo "OK"
fi