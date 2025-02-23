#VNET name
variable "vnet_name" {
  type    = string
  default = ""
}

#VNET Location
variable "location" {
  type    = string
  default = ""
}

#VNET Location
variable "rg_name" {
  type    = string
  default = ""
}

#Address Space
variable "address_space" {
  type    = list(string)
  default = ""
}

#Tags
variable "tags" {
  type    = map(any)
  default = {}
}
