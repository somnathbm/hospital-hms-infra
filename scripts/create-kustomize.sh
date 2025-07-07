#!/bin/bash

set -e

# Export the raw templates
helm template my-opd-svc ./charts/opd-service -f ./kustomize/overlays/dev/opd/opd-values.yaml > ./kustomize/base/opd/opd-service.yaml
helm template my-billing-svc ./charts/billing-service -f ./kustomize/overlays/dev/billing/billing-values.yaml > ./kustomize/base/billing/billing-service.yaml
helm template my-appointment-svc ./charts/appointment-service -f ./kustomize/overlays/dev/appointment/appointment-values.yaml > ./kustomize/base/appointment/appointment-service.yaml

# generate the Kustomization.yaml file
cat >./kustomization.yaml << EOF
    apiVersion: kustomize.config.k8s.io/v1beta1
    kind: Kustomization
    namespace: hospital-dev

    resources:
    - opd-service.yaml
    - billing-service.yaml
    - appointment-service.yaml
EOF

# Check existance of kustomization.yaml file
cat ./kustomization.yaml

if [[ $? != 0 ]]; then
  echo "Error creating kustomization.yaml"
  exit 1
else
  # create the "hospotal-dev" namespace first
  kubectl create ns hospital-dev

  # apply the kustomization.yaml
  kubectl apply -k .  
fi