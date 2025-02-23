# Acme Corporation - E-commerce API Project (Terraform Code)

# Developed the Terraform Code to deploy the following Azure resources

1. Resource group
2. VNET
3. 3 Subnets (Itntegration for Frontend, Middleware and Data Subnets)
4. App Service Plan (Windows)
5. 2 Web Apps (Backend for Front End WebAPI, Middleware WebAPI)
6. Applciation Insights 
6. Azure SQL DB with a SQL Sever - Encrypted at rest by using Customer Managed Key (CMK) and Transparent Data Encryption feature
7. Private end points for the Middleware WebAPI and Azure SQL DB
8. Keyvault
9. Network security group attached to the SQL Subnet to allow only from Middleware Web API (TCP-1433)


# Terraform Modules
Re-usable Terraform IaC modules have been created for the following components
1. resourcegroup
2. app-svc-plan
3. subnet
4. vnet
5. windows-webapp

**Note: Reusbale Modules can be created for other azure compnents  as well. Due to timeconstraints, restricted to the above resouces**

# Testing
Validated and tested the code using Azure Free tier subscription. 
For CI/CD pipleines, used Terraform Cloud (personal)
