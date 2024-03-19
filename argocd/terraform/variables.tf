variable "dev-clu-location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "rg-devclu" {
  type        = string
  default     = "rg-kuberada-cluster"
  description = "Location of the resource group."
}

variable "aks" {
  type        = string
  default     = "kuberada-clu"
  description = "AKS clsuter name"
}

