#Resource Group name
variable "rg_name" {
  type    = string
  default = ""
}

#Resource Gourp Location
variable "location" {
  type    = string
  default = ""
}

#Tags
variable "tags" {
  type    = map(any)
  default = {}
}
