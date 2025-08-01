variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Name for resource group"
  type        = string
  default     = "aso-aks-rg"
}

variable "aks_cluster_name" {
  description = "Name of AKS cluster"
  type        = string
  default     = "aso-aks-cluster"
}
