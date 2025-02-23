variable "pe_name" {
  type    = string
  default = null
}

# (Required) Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created.
variable "rg_name" {
  type    = string
  default = null
}

# (Required) The supported Azure location where the resource exists. Changing this forces a new resource to be created.
variable "location" {
  type    = string
  default = null
}

# (Required) The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created.
variable "subnet_id" {
  type    = string
  default = null
}

# (Required) A private_service_connection block as defined below.
variable "private_service_connection" {
  type = list(object({

    name                 = string # (Required) Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created.
    is_manual_connection = bool   # (Required) Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created. If you are trying to connect the Private Endpoint to a remote resource without having the correct RBAC permissions on the remote resource set this value to true.
    request_message      = string # (Optional) A message passed to the owner of the remote resource when the private endpoint attempts to establish the connection to the remote resource. The provider allows a maximum request message length of 140 characters, however the request message maximum length is dependent on the service the private endpoint is connected to. Only valid if is_manual_connection is set to true.
    # NOTE: When connected to an SQL resource the request_message maximum length is 128.
    private_connection_resource_id    = string       # (Optional) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private_connection_resource_id or private_connection_resource_alias must be specified. Changing this forces a new resource to be created. For a web app or function app slot, the parent web app should be used in this field instead of a reference to the slot itself.
    private_connection_resource_alias = string       # (Optional) The Service Alias of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private_connection_resource_id or private_connection_resource_alias must be specified. Changing this forces a new resource to be created.
    subresource_names                 = list(string) # (Optional) A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id. Possible values are detailed in the product documentation in the Subresources column. Changing this forces a new resource to be created.
    # NOTE: Some resource types (such as Storage Account) only support 1 subresource per private endpoint.
    # NOTE: For most Private Links one or more subresource_names will need to be specified, please see the linked documentation for details.
  }))
  default = []
}

# (Optional) The custom name of the network interface attached to the private endpoint. Changing this forces a new resource to be created.
variable "custom_network_interface_name" {
  type    = string
  default = null
}

# (Optional) A private_dns_zone_group block as defined below.
variable "private_dns_zone_group" {
  type = list(object({

    dns_zone_name = string       # (Required) Specifies the Name of the Private DNS Zone Group.
    dns_zone_ids  = list(string) # (Required) Specifies the list of Private DNS Zones to include within the private_dns_zone_group.
  }))
  default = []
}

# An ip_configuration block supports the following:
variable "ip_configuration" {
  type = list(object({
    name               = string # (Required) Specifies the Name of the IP Configuration. Changing this forces a new resource to be created.
    private_ip_address = string # (Required) Specifies the static IP address within the private endpoint's subnet to be used. Changing this forces a new resource to be created.
    subresource_name   = string # (Optional) Specifies the subresource this IP address applies to. subresource_names corresponds to group_id. Changing this forces a new resource to be created.
    member_name        = string # (Optional) Specifies the member name this IP address applies to. If it is not specified, it will use the value of subresource_name. Changing this forces a new resource to be created.
  }))
  default = []
}

# (Optional) A mapping of tags to assign to the resource.
variable "tags" {
  type    = map(any)
  default = {}
}
