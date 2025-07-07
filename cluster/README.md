# cluster

The `/cluster` contains all the cluster wise configuration required, such as:
  - Ingress (North-South)
  - Gateway with traffic splitting and monitoring (North-South)
  - Service Mesh (East-West)
  - RBAC
  - Network policies (simple, OPA Gatekeeper or Kyverno)
  - CLuster bootstrap config (kind or EKS)