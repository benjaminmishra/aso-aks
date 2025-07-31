#!/usr/bin/env bash
set -euo pipefail

mkdir -p build

# Package Helm charts
helm package helm/redis-chart -d build
helm package helm/sql-chart -d build

# Generate Terraform plan (offline)
terraform init -backend=false infra
terraform plan -out build/plan.tfplan infra
