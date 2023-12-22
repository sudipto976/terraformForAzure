resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azregion
}

resource "azurerm_storage_account" "mystorgae" {
  name                     = var.storagename
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.accesstier
  account_replication_type = var.replicationtype

  tags = {
    environment = "staging"
    owner       = "Mr. ${local.name}"
  }
}

output "priamrykey" {
  value     = azurerm_storage_account.mystorgae.primary_access_key
  sensitive = true
}
