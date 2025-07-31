#!/usr/bin/env bash
set -euo pipefail

# Lint Terraform configuration
terraform fmt -check infra
terraform init -backend=false infra
terraform validate infra

# Lint Helm charts
helm lint helm/redis-chart
helm lint helm/sql-chart
