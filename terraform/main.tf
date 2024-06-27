terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.106.1"
    }
  }
}

provider "azurerm" {
  features {}
  # Configuration options
}

data "azurerm_client_config" "WireApps" {}

resource "azurerm_resource_group" "wireappas-rg" {
  name     = "WireApps"
  location = "South India"
  tags = {
    enverionment = "development"
  }
}

module "network" {
  source              = "./modules/network"
  vnet_name           = "WireApps_VN"
  address_space       = ["172.16.0.0/24"]
  location            = "South India"
  resource_group_name = "WireApps"
  subnet_name         = "WireApps_SN"
  subnet_prefix       = ["172.16.0.0/26"]
  nsg_name            = "WireApps-NSG"
}

module "webapp" {
  source              = "./modules/webapp"
  app_service_plan_name = "Wireapps_SP"
  app_service_name    = "WireApps"
  location            = "South India"
  resource_group_name = "WireApps"
}

module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = "WireApps"
  location            = "South India"
  tenant_id           = data.azurerm_client_config.WireApps.tenant_id
  admin_password      = module.keyvault.admin_password
}

module "postgresql" {
  source              = "./modules/postgresql"
  resource_group_name = "WireApps"
  location            = "South India"
  subnet_id           = module.network.subnet_id
  keyvault_id         = module.keyvault.keyvault_id
 # admin_password      = var.admin_password
}