#NSG name
module "nsg_name" {
  source      = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format = "res_type|-|site|-|env|-|app|-|name"
  naming_convention_info = {
    for key, value in var.nsg_info :
    "${key}" => {
      name_info = merge(var.naming_convention_info, { name = key })
      tags      = var.tags
    }
  }
  resource_type = "nsg"
}


module "nsg_flow_log_name" {
  source      = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format = "res_type|-|site|-|env|-|app|-|name"
  naming_convention_info = {
    for key, value in var.nsg_info :
    "${key}" => {
      name_info = merge(var.naming_convention_info, { name = key })
      tags      = var.tags
    }
  }
  resource_type = "nfl"
}
