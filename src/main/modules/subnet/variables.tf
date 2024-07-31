variable "tags" {
  type = map(string)
  default = {
    Name        = "tf-main"
    Environment = "prod"
  }
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "name" {
  description = "Name of subnet"
  type        = string
}

variable "address_prefixes" {
  description = "Address prefixes"
}

variable "vnet_name" {
  description = "Name of Vnet"
  type        = string
}
