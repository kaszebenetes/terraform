variable "tags" {
  type = map(string)
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "address_space" {
  description = "Info about address space"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "UK South"
}

variable "name" {
  description = "Name of virtual network"
}

# variable "dns_servers" {
#   type        = string
#   description = "Type dns servers addresses"
# }
