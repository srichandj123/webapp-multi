#name of the svc plan
variable "apsvc_name" {
  type    = string
  default = ""
}

#location of the svc plan
variable "location" {
  type    = string
  default = ""
}

#resourcegroup name
variable "rg_name" {
  type    = string
  default = ""
}

#OS Type
variable "os_type" {
  type    = string
  default = "Windows"
}

#SKU Name
variable "sku_name" {
  type    = string
  default = ""

}