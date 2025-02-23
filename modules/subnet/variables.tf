# Subnet Resource Group name
variable "rg_name" {
  type    = string
  default = ""
}
# Virtual Network name
variable "vnet_name" {
  type    = string
  default = ""
}
# Subnets
variable "subnets" {
  description = "List of subnets"
  type = list(
    object(
      {
        snet_name        = string,       # Name of the subnet
        address_prefixes = list(string), # Subnet Address Prefixes
      }
    )
  )
  default = []
}

