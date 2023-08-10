locals {

    tags = {
    created-by = "Terraform"
    }

  naming_convention_info = {
    name         = "eg"
    project_code = "boj"
    env          = "dev"
    zone         = "z1"
    agency_code  = "brettoj"
    tier         = "web"
  }
}

module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags = local.tags
    }
  }
}


resource "azurerm_network_security_group" "test-nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = module.resource_groups.rg_output[1].name
    tags = local.tags
}