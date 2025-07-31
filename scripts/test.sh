#!/usr/bin/env bash
set -euo pipefail

# Verify required commands are available
for cmd in helm terraform; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: $cmd is not installed or not in PATH" >&2
    exit 1
  fi
done

# Lint Terraform configuration
terraform -chdir=infra fmt -check
terraform -chdir=infra init -backend=false
terraform -chdir=infra validate

# Lint Helm charts
helm lint helm/redis-chart
helm lint helm/sql-chart

