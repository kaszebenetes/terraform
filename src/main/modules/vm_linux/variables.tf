variable "tags" {
  type = map(string)
  default = {
    Name        = "tf-main"
    Environment = "prod"
  }
}
variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "vm-linux_lb"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location for the resources"
  type        = string
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_B1s"
}

variable "type_of_nic" {
  description = "Type of NIC"
  type        = string
  default     = "internal"
}

variable "boot_diagnostics_st_uri" {
  description = "Boot diagnostic Storage account"
  type        = string
}

variable "nic_name" {
  description = "Name of the NIC"
  type        = string
  default     = "vm-nic-lb"
}

variable "ip_allocation" {
  description = "IP allocation method"
  type        = string
  default     = "Static"
}

variable "private_ip_address" {
  description = "Private IP address for the NIC"
  type        = string
  default     = "10.0.1.4"
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "pip_name" {
  description = "Name of the public IP"
  type        = string
  default = null
}

variable "allocation_method" {
  description = "IP allocation method for the public IP"
  type        = string
  default     = "Static"
}

variable "ext_name" {
  description = "Type name of Vm extension"
  type        = string
  default     = "Static"
}

variable "pip_enabled" {
  description = "Type name of Vm extension"
  type        = bool
  default     = false
}
