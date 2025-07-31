# ASO AKS Setup

This repository provisions an Azure Kubernetes Service (AKS) cluster using Terraform and installs [Azure Service Operator](https://azure.github.io/azure-service-operator/) (ASO) via Helm.

## Repository Structure

```
aso-aks/
├── infra/
│   ├── main.tf        # Terraform definition for AKS and ASO installation
│   ├── variables.tf   # Terraform variables with placeholder values
│   └── outputs.tf     # Useful outputs such as command to fetch kubeconfig
├── helm/
│   ├── aso-values.yaml    # Helm values for ASO installation
│   ├── redis-chart/       # Helm chart for Azure Redis Cache via ASO
│   └── sql-chart/         # Helm chart for Azure SQL resources via ASO
└── README.md
```

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) 1.2 or later
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/)

Ensure you are logged in with the Azure CLI:

```bash
az login
```

## Configuration

1. Update `infra/variables.tf` with your Azure subscription and tenant IDs.
2. Update `helm/aso-values.yaml` with matching subscription and tenant IDs or other settings.

## Deployment

```bash
cd infra
terraform init
terraform apply
```

Once the apply completes, fetch cluster credentials:

```bash
terraform output -raw kube_config_command | bash
```

Verify ASO is installed and CRDs are present:

```bash
kubectl get crds | grep azure
```

A successful output listing Azure-related CRDs confirms that ASO is running.

## Deploy Example Azure Services

Two Helm charts are provided to demonstrate provisioning Azure resources via ASO:

* `helm/redis-chart` installs an Azure Redis Cache instance.
* `helm/sql-chart` installs an Azure SQL Server and Database.

Deploy them using Helm once the cluster is ready:

```bash
helm install redis-release ./helm/redis-chart
helm install sql-release ./helm/sql-chart
```
