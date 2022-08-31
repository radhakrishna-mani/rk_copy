# Main configuration file

resource "azurerm_resource_group" "1phm_rg" {
  name     = "1phm1993_resources"
  location = "UK south"
}
data "azurerm_image" "custom" {
name                  = "terraformimage"
resource_group_name   = azurerm_resource_group.1phm_rg.name
}

resource "azurerm_virtual_network" "1phm_vnet" {
  name                = "1phm1993-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.1phm_rg.location
  resource_group_name = azurerm_resource_group.1phm_rg.name
}

resource "azurerm_subnet" "1phm_subnet" {
  name                 = "1phm1_subnet"
  resource_group_name  = azurerm_resource_group.1phm_rg.name
  virtual_network_name = azurerm_virtual_network.1phm_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "1phm_interface" {
  name                = "1phm1993-nic"
  location            = azurerm_resource_group.1phm_rg.location
  resource_group_name = azurerm_resource_group.1phm_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.1phm_subnet.id
    private_ip_address_allocation = "Dynamic"

}
}
resource "azurerm_network_security_group" "1phm_nsg" {
name                    = "1phm_nsg"
 location              = azurerm_resource_group.1phm_rg.location
  resource_group_name   = azurerm_resource_group.1phm_rg.name
}
# Main configuration file

resource "azurerm_resource_group" "1phm_rg" {
  name     = "1phm1993_resources"
  location = "UK south"
}
data "azurerm_image" "custom" {
name                  = "terraformimage"
resource_group_name   = azurerm_resource_group.1phm_rg.name
}

resource "azurerm_virtual_network" "1phm_vnet" {
  name                = "1phm1993-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.1phm_rg.location
  resource_group_name = azurerm_resource_group.1phm_rg.name
}

resource "azurerm_subnet" "1phm_subnet" {
  name                 = "1phm1_subnet"
  resource_group_name  = azurerm_resource_group.1phm_rg.name
  virtual_network_name = azurerm_virtual_network.1phm_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "1phm_interface" {
  name                = "1phm1993-nic"
  location            = azurerm_resource_group.1phm_rg.location
  resource_group_name = azurerm_resource_group.1phm_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.1phm_subnet.id
    private_ip_address_allocation = "Dynamic"

}
}
resource "azurerm_network_security_group" "1phm_nsg" {
name                    = "1phm_nsg"
 location              = azurerm_resource_group.1phm_rg.location
  resource_group_name   = azurerm_resource_group.1phm_rg.name
}
admin_username = "testadmin"
 admin_password = "Password1234!"
   }
    os_profile_linux_config {
      disable_password_authentication = false
    }
  
    connection {
      type     = "ssh"
      user     = "azureuser"
      password = "prasad@123456"
      host     = data.azurerm_public_ip.public_ip.ip_address
  }
  
   provisioner "remote-exec" {
       inline = [
        "docker login prasadregistry.azurecr.io -u prasadregistry -p hq+4PUO/Fehy=SOR1AgmQpeF=IeqHCqB
        "docker pull prasadregistry.azurecr.io/ubuntu:1.7" 
        "docker run -d -p 8969:8080 prasadregistry.azurecr.io/ubuntu"
     ]
   }
 }
