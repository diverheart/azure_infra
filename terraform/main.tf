terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "e8e4c4b2-0830-494b-be62-9eb0ed62e9f2"
  tenant_id = "1f2570ff-92be-43ad-b956-31fa87a29d03"
}

module "Security" {
  source = "./modules/Security"
  rg_name = var.rg_name
  ng_name = var.ng_name
}

//module.<object-name>.<output-name>
module "Network" {
  source = "./modules/Network"
  rg_name = module.Security.rg_name
  vn_name = var.vn_name
  ng_id = module.Security.ng_id
  ni_name = var.ni_name
}
