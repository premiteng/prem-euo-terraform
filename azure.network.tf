#Creating azure network
resource "azurerm_virtual_network" "premaz-network" {
resource_group_name = data.azurerm_resource_group.prem-existing-rsgrp.name
location = data.azurerm_resource_group.prem-existing-rsgrp.location
name = "prem-network"
address_space = ["10.0.0.0/16"]
}

#creating subnet
resource "azurerm_subnet" "prem-subnet1" {
name = "prem-internal-subnet"
virtual_network_name = azurerm_virtual_network.premaz-network.name
resource_group_name = data.azurerm_resource_group.prem-existing-rsgrp.name
address_prefixes = ["10.0.1.0/24"]
}

## creating network interface
resource "azurerm_network_interface" "prem-vm1-nic1" {
name = "prem-network-interface1"
resource_group_name = data.azurerm_resource_group.prem-existing-rsgrp.name
location = data.azurerm_resource_group.prem-existing-rsgrp.location
ip_configuration {
subnet_id = azurerm_subnet.prem-subnet1.id
private_ip_address_allocation = "Dynamic"
public_ip_address_id = azurerm_public_ip.prem-public-ip1.id
name = "prem-ip1"
}
}

# Creating public ip
resource "azurerm_public_ip" "prem-public-ip1" {
name = "prempub-ip1"
resource_group_name = data.azurerm_resource_group.prem-existing-rsgrp.name
location = data.azurerm_resource_group.prem-existing-rsgrp.location
allocation_method = "Static"
}
