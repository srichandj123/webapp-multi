#name of the svc plan
variable "apsvc_name" {
  type    = string
  default = ""
}

#Location of the svc plan
variable "location" {
  type    = string
  default = ""
}

#resourcegroup name
variable "rg_name" {
  type = string
}

#OS Type
variable "os_type" {
  type = string
}

#SKU Name
variable "sku_name" {
  type = string
}
