resource "azurerm_mssql_server" "example4" {
  name                         = "example-sqlserver-very-unique"
  resource_group_name          = azurerm_resource_group.example1.name
  location                     = azurerm_resource_group.example1.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "example5" {
  name           = "example-db"
  server_id      = azurerm_mssql_server.example4.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true
  enclave_type   = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
