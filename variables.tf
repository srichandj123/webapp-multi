#Resource Group Name
variable "rg_name" {
  type = string
}
#Location
variable "location" {
  type = string
}

#VNet Name
variable "vnet_name" {
  type = string
}

#Front-End app SVC Plan
variable "fe_apsvc_plan" {
  type = string
}

#Front-End app SVC Name
variable "fe_webapi_name" {
  type = string
}

#Front-End app SVC Plan
variable "mid_apsvc_plan" {
  type = string
}

#Front-End app SVC Name
variable "mid_webapi_name" {
  type = string
}

#Azure SQL Server Name
variable "mssql_name" {
  type = string
}

#Azure SQL Server DB
variable "mssql_db" {
  type = string
}