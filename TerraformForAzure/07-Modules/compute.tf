data "azurerm_subnet" "subnet" {
  resource_group_name  = "Sudiptorg"
  name                 = "internal"
  virtual_network_name = "example-network"
}

module "compute" {
  source                   = "Azure/compute/azurerm"
  version                  = "5.3.0"
  resource_group_name      = "Sudiptorg"
  vnet_subnet_id           = data.azurerm_subnet.subnet.id
  is_windows_image         = true
  vm_os_simple             = "WindowsServer"
  availability_set_enabled = false
  admin_username           = "meadmin"
  admin_password           = "Admin@123"

}

