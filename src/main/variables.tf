variable "region" {
  type    = string
  default = "UK South"
}

variable "tags" {
  type = map(string)
  default = {
    Name        = "tf-main"
    Environment = "prod"
  }
}
variable "boot_diagnostics_sa_type" {
  description = "(Optional) Storage account type for boot diagnostics"
  default     = "Standard_LRS"
}

variable "project_prefix" {
  type = string
  default = "kaszebenetes-tf-prod"
}
