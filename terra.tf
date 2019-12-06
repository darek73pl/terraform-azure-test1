terraform {
  backend "azurerm" {
    resource_group_name  = "Constant-RG"
    storage_account_name = "dartest01"
    container_name       = "terraform-state-jenkins"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.36.0"

/*  client_id="56734769-eb5d-4ef2-9f3e-63be21d88528"
  client_secret="rYqBPiW8Fo:O/?dA.nciejC8JC8J51X4"
  tenant_id="1c65a708-c899-485d-ad68-d53560fa74ba"*/
  subscription_id="98e03152-0027-41fa-a4af-1b6b1100e212"
}


resource "azurerm_resource_group" "RG" {
  name     = "jenkins"
  location = "West Europe"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "darek-net"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.RG.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "vnet_subnet" {
  name                      = "sub1"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  address_prefix            = "10.0.1.0/24"
}