Yes, I can turn this setup into a **Codex task** for `GitHub Copilot Enterprise / Copilot Workspace` or any internal Codex-based workflow.

Here’s a clean and scoped **task definition** with goal, context, constraints, and deliverables:

---

## ✅ Codex Task: Provision AKS Cluster with Azure Service Operator Using Terraform and Helm

---

### 🧠 Goal

Provision an Azure Kubernetes Service (AKS) cluster using Terraform, and install [Azure Service Operator (ASO)](https://azure.github.io/azure-service-operator/) using Helm charts. This cluster will later be used to provision Azure resources declaratively via ASO custom resources.

---

### 📦 Context

* You will use:

  * **Terraform** to provision the AKS cluster
  * **Helm provider in Terraform** to install ASO
* The setup should use **dummy placeholder credentials** (`<your-subscription-id>`, etc.) for now.
* Target environment is Azure **West Europe** region.
* Resulting AKS cluster should be managed via system-assigned identity.
* The ASO Helm chart should be configured via `aso-values.yaml` with basic CRDs enabled.

---

### ✅ Constraints

* Must use latest compatible version of Azure Service Operator (`>=1.1.0`)
* Use separate folders for Terraform and Helm configuration.
* Values should be externalized via a YAML file (`aso-values.yaml`)
* Keep it modular and production-ready
* Follow Terraform module best practices and file breakdown (`main.tf`, `variables.tf`, `outputs.tf`)

---

### 📤 Deliverables

* `infra/main.tf`: Terraform definition for AKS and Helm release
* `infra/variables.tf`: Terraform variables
* `infra/outputs.tf`: Terraform outputs
* `helm/aso-values.yaml`: Helm values for ASO configuration
* `README.md`: Setup instructions

---

### 📁 Suggested Repo Structure

```
aso-aks/
├── infra/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── helm/
│   └── aso-values.yaml
├── README.md
```

---

### ✅ Completion Criteria

* A single `terraform apply` command provisions the cluster and installs ASO.
* CRDs are successfully registered (`kubectl get crds | grep azure`).
* A README exists with clearly documented steps to use and verify the setup.

---

Would you like this written as a GitHub issue, project task file (e.g., `.codex.yaml`), or markdown file inside the repo (e.g., `TASK.md`)?
