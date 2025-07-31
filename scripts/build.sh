#!/usr/bin/env bash
set -euo pipefail

# Verify required commands are available
for cmd in helm terraform; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: $cmd is not installed or not in PATH" >&2
    exit 1
  fi
done

mkdir -p build

# Package Helm charts
helm package helm/redis-chart -d build
helm package helm/sql-chart -d build

# Generate Terraform plan (offline)
terraform -chdir=infra init -backend=false
terraform -chdir=infra plan -out=../build/plan.tfplan

