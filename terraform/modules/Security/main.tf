resource "azurerm_resource_group" "azure_rg_env" {
  name     = var.rg_name
  location = "eastus2"
}

resource "azurerm_network_security_group" "azure_ng_env" {
  name                = var.ng_name
  location            = azurerm_resource_group.azure_rg_env.location
  resource_group_name = azurerm_resource_group.azure_rg_env.name
  security_rule {
    name                       = "Allow_SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Allow_RDP"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}