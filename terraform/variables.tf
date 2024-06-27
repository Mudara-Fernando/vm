variable "storage_account_name" {
  description = "The name of the Azure Storage Account"
  type        = string
}

variable "container_name" {
  description = "The name of the container in the Azure Storage Account"
  type        = string
}

variable "key" {
  description = "The path to the Terraform state file in the container"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account is located"
  type        = string
  default = "South India"
}

variable "client_id" {
  description = "The Azure region where the storage account is located"
  type        = string
}

variable "client_secret" {
  description = "The Azure region where the storage account is located"
  type        = string
}

variable "subscription_id" {
  description = "The Azure region where the storage account is located"
  type        = string
}

variable "tenant_id" {
  description = "The Azure region where the storage account is located"
  type        = string
}