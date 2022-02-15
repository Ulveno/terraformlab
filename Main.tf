#Create resource group
resource "azurerm_resource_group" "this" {
   
   name     = var.rgname
   location = var.location   
}
#Create Virtual network
resource "azurerm_virtual_network" "this" {

  for_each = var.Vnet-config   

  name                = each.key    
  location            = var.location
  resource_group_name = var.rgname 
  address_space       = each.value
  depends_on          = [azurerm_resource_group.this]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}
#Create Virtual subnet

resource "azurerm_subnet" "subnet" {

  for_each = var.subnet

  name                 = each.value["name"]
  resource_group_name  = each.value["resource_group_name"]
  virtual_network_name = each.value["virtual_network_name"]
  address_prefixes     = each.value["address_prefixes"]
  depends_on           = [azurerm_resource_group.this, azurerm_virtual_network.this]
}




