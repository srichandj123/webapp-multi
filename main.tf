#Resource Group Module
module "rg" {
  source   = "./modules/resource-group"
  rg_name  = "sri-webapp-sqldb-rg01"
  location = "East US"
  tags = {
    Application = "3 Tier App"
    Owner       = "Srichand"
  }
}

module "prodvnet" {
  source        = "./modules/vnet"
  vnet_name     = "prod-vnet01"
  location      = module.rg.location
  rg_name       = module.rg.rg_name
  address_space = ["10.0.0.0/16"]
  tags          = module.rg.tags
}

module "subnet" {
  source = "./modules/subnet"
  subnets = [
    {
      snet_name        = "middleware-subnet"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      snet_name        = "data-subnet"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]
  rg_name   = module.rg.rg_name
  vnet_name = module.prodvnet.vnet_name

}


resource "azurerm_user_assigned_identity" "admin" {
  name                = "sql-admin"
  location            = module.rg.location
  resource_group_name = module.rg.rg_name
}
