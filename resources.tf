
resource "azurerm_resource_group" "azy_network" {
  location = "West US"
  name = "devresgrp"
}

resource "azurerm_virtual_network" "blue_virtual_network" {
  address_space = ["10.0.0.0/16"]
  location = "West US"
  name = "bluevirtnetwork"
  resource_group_name = "${azurerm_resource_group.azy_network.name}"
  dns_servers = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  tags {
    environment = "blue-world-finder"
  }
}