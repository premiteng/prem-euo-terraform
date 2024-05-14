# creating azure virtual machine of linux type
resource "azurerm_linux_virtual_machine" "prem-vm1" {
    name = "prem-linux-vm1"
    resource_group_name = data.azurerm_resource_group.prem-existing-rsgrp.name
    location = data.azurerm_resource_group.prem-existing-rsgrp.location
    admin_username = "prem"
    admin_password = "Test@2024"
    disable_password_authentication = false
    network_interface_ids = [azurerm_network_interface.prem-vm1-nic1.id]
    size = "Standard_B1s"
   os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}  
