resource "random_string" "random" 
{
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "azurerm_resource_group" "terraform_resource_group" 
{
  name     = random_string.random
  location = var.location
}

resource "azurerm_storage_account" "terraform_storage_account" 
{
  name                = "storageterraform0914"
  resource_group_name = azurerm_resource_group.terraform_resource_group.name
  location                 = azurerm_resource_group.terraform_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}