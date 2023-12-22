resource "azurerm_resource_group" "Sudiptorg" {
  name     = "Sudiptorg"
  location = "EastUS"
}


resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.Sudiptorg.location
  resource_group_name = azurerm_resource_group.Sudiptorg.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.Sudiptorg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.Sudiptorg.location
  resource_group_name = azurerm_resource_group.Sudiptorg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.Sudiptorg.name
  location            = azurerm_resource_group.Sudiptorg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  # provisioner "local-exec" {
  #   command = "echo ${self.private_ip_address} >> private_ip.txt"
  # }

  # provisioner "file" {
  #   source      = "sud.txt"
  #   destination = "c:\\"
  #   connection {
  #     type     = "winrm"
  #     user     = azurerm_windows_virtual_machine.example.admin_username
  #     password = azurerm_windows_virtual_machine.example.admin_password
  #     host     = ""
  #   }
  # }
  # provisioner "remote-exec" {



  # }
}

resource "null_resource" "status" {
  provisioner "local-exec" {
    command = "az vm get-instance-view --name example-machine --resource-group sudiptorg --query instanceView.statuses[1] --output-table"
  }
  depends_on = [
    azurerm_windows_virtual_machine.example
  ]
}
