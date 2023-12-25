resource "azurerm_databricks_workspace" "example" {
  name                = "databricks-test"
  resource_group_name = azurerm_resource_group.example1.name
  location            = azurerm_resource_group.example1.location
  sku                 = "standard"

  tags = {
    Environment = "Production"
  }
}
