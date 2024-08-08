resource "azurerm_service_plan" "function_srv_plan" {
  name                = "kaszebe-function-srv-plan"
  resource_group_name = azurerm_resource_group.rg-tfstates.name
  location            = azurerm_resource_group.rg-tfstates.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

# resource "azurerm_function_app" "function_app" {
#   name                       = "kaszebe-function-app"
  # resource_group_name        = azurerm_resource_group.rg-tfstates.name
  # location                   = azurerm_resource_group.rg-tfstates.location

  # storage_account_name       = azurerm_storage_account.st_function.name
  # storage_account_access_key = azurerm_storage_account.st_function.primary_access_key

#   app_service_plan_id        = azurerm_service_plan.function_srv_plan.id

  # identity {
  #   type = "UserAssigned"
  #   identity_ids = [azurerm_user_assigned_identity.uai.id]
  # }
# }

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app
resource "azurerm_linux_function_app" "function_app" {
  name                       = "kaszebe-function-app"
  resource_group_name        = azurerm_resource_group.rg-tfstates.name
  location                   = azurerm_resource_group.rg-tfstates.location

  storage_account_name       = azurerm_storage_account.st_function.name
  storage_account_access_key = azurerm_storage_account.st_function.primary_access_key
  # storage_uses_managed_identity = true

  service_plan_id            = azurerm_service_plan.function_srv_plan.id
  # public_network_access_enabled = false

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uai.id]
  }

  # zip_deploy_file = data.archive_file.ps_function_package.output_path

  site_config {
    application_stack {
      # docker {
      #   registry_url = "mcr.microsoft.com"
      #   image_name = "azure-cli"
      #   image_tag = "latest"
      # }
      powershell_core_version = "7.2"
      # powershell_core_version = "7.4"
      # use_custom_runtime = true
    }
    cors {
      allowed_origins = ["https://portal.azure.com"]
    }
  }

  # app_settings {
  #   AzureWebJobsStorage
  # }

}

data "archive_file" "ps_function_package" {
  type = "zip"
  source_dir  = "func/"
  output_path = "function.zip"
}
