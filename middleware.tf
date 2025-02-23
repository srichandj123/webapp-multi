module "mid-webapsvcplan" {
  source     = "./modules/app-svc-plan"
  apsvc_name = "middle-webapi-svc-plan"
  rg_name    = module.rg.rg_name
  location   = module.rg.location
  os_type    = "Windows"
  sku_name   = "P0v3"
}

module "mid-webapp" {
  source        = "./modules/windows-webap"
  webapp_name   = "acme-mid-webapi"
  location      = module.rg.location
  rg_name       = module.rg.rg_name
  svc_plan_id   = module.mid-webapsvcplan.appsvc_plan_id
  public_access = false

}
