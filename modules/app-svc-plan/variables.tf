#name of the svc plan
variable "name" {
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
# variable "os_type {
#   type    = string
#   default = "Windows"
# }

variable "maximum_elastic_worker_count" {
  
}
variable "maximum_elastic_worker_count" {
  
}
#Tags
variable "tags" {
  type    = map(any)
  default = {}
}
