terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  # skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}

  # use_msi = true
  # use_cli = false
  # msi_endpoint = "http://127.0.0.1:8081/metadata/identity/oauth2/token"
  # client_id = "2bb3ed0c-940c-4a3e-9d69-55304e765827"
  # tenant_id = "943b4232-710f-4cdb-8760-b5bf1777cc0e"
  # subscription_id = "ac976d29-ee84-45b9-b0e3-8e4597f643ee"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-tfstates"          # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "kaszebetfstates"             # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstates"                    # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "main-prod.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.

    # use_msi              = true
    # subscription_id = "ac976d29-ee84-45b9-b0e3-8e4597f643ee"
    # msi_endpoint = "http://127.0.0.1:8081/metadata/identity/oauth2/token"
  }
}
