variable "webapp_name" {
  type = string
}

#location of the svc plan
variable "location" {
  type    = string
  default = ""
}

#resourcegroup name
variable "rg_name" {
  type = string
}

variable "svc_plan_id" {
  type = string
}

variable "public_access" {
  type = bool
}