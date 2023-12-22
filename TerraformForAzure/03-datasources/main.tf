data "azurerm_resource_group" "NewRG" {
  name = "sudiptorg"
}

resource "azurerm_storage_account" "mystorgae" {
  name                     = "veryuniquelynamedstorageiguess"
  resource_group_name      = azurerm_resource_group.NewRG.name
  location                 = azurerm_resource_group.NewRG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
    owner       = "Sudipto"
  }
}
