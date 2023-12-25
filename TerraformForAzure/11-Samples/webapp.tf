
resource "azurerm_resource_group" "example1" {
  name     = "example-resources"
  location = "EastUS"
}

resource "azurerm_service_plan" "example2" {
  name                = "example-serviceplan"
  resource_group_name = azurerm_resource_group.example1.name
  location            = azurerm_resource_group.example1.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "example3" {
  name                = "sudiptoterraformwebapp"
  resource_group_name = azurerm_resource_group.example1.name
  location            = azurerm_service_plan.example2.location
  service_plan_id     = azurerm_service_plan.example2.id

  site_config {}
}

