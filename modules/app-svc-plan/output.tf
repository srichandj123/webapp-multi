#App SVC ID
output "appsvc_plan_id" {
  value       = azurerm_service_plan.app_svcplan.id
  description = "The ID of the App SVC Plan"
}