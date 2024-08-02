variable "region" {
  type    = string
  default = "UK South"
}

variable "tags" {
  type = map(string)
  default = {
    Name        = "kaszebenetes-tf"
    Environment = "prod"
    Owner       = "Terraform"
  }
}

variable "boot_diagnostics_sa_type" {
  description = "(Optional) Storage account type for boot diagnostics"
  default     = "Standard_LRS"
}

variable "project_prefix" {
  type    = string
  default = "kaszebenetes-tf-prod"
}
