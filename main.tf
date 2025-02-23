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

