variable "tags" {
  type = map(string)
  default = {
    Name        = "tf-main"
    Environment = "prod"
  }
}
variable "vm_name" {
  description = "Prefix for the VM names"
  type        = string
  default     = "vm-linux_web"
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

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "files/id_rsa.pub"
}

variable "type_of_nic" {
  description = "Type of NIC"
  type        = string
  default     = "internal"
}

variable "nic_name" {
  description = "Prefix for the NIC names"
  type        = string
  default     = "vm-nic-web"
}

variable "ip_allocation" {
  description = "IP allocation method"
  type        = string
  default     = "Static"
}

variable "private_ip_address" {
  description = "Base IP address for the private IPs"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "ext_name" {
  description = "Prefix for the extension names"
  type        = string
  default     = "vm-linux-web"
}
