// Virtual Network
resource "azurerm_virtual_network" "azure_vn_env" {
  name                = var.vn_name
  location            = "eastus2"
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
 
}

// Public Subnet
resource "azurerm_subnet" "public" {
  name                 = "public-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vn_name
  address_prefixes     = ["10.0.1.0/24"]

}

// Private Subnet
resource "azurerm_subnet" "private" {
  name                 = "private-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vn_name
  address_prefixes     = ["10.0.2.0/24"]

}

// Public ip
resource "azurerm_public_ip" "azure_ip_env" {
  name                    = "public-ip"
  location                = "eastus2"
  resource_group_name     = var.rg_name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
}

// NSG allocation to public subnet
resource "azurerm_subnet_network_security_group_association" "association" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = var.ng_id
}

// NIC for Public subnet
resource "azurerm_network_interface" "azure_ni_env" {
  name                = var.ni_name
  location            = "eastus2"
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "Pub-IP"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.azure_ip_env.id
  }
}

// NIC for Private Subent
resource "azurerm_network_interface" "azure_ni_env_2" {
  name                = "${var.ni_name}_priv"
  location            = "eastus2"
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "Priv-IP"
    subnet_id                     = azurerm_subnet.private.id
    private_ip_address_allocation = "Dynamic"
    
  }
}