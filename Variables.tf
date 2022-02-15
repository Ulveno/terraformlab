variable "location" {
    description = "lab"
    type        = string
    default     = "WestEurope"
}

variable "rgname" {

    type    = string   
    default = "RG32"
}

#Vnet configs

variable "Vnet-config" {

  type = map(any)
  default = {
   
      "Spoke1"     =  ["10.0.0.0/16"],
      "Spoke2"     =  ["10.1.0.0/16"],
      "Spoke3"     =  ["10.2.0.0/16"],
      "Hub"        =  ["10.3.0.0/16"]
  }
}

variable "subnet" {
  description = "Map of Azure VNET subnet configuration"
  type        = map(any)
  default = {
    Spoke1_subnet = {
      name                 = "Spoke1_subnet"
      resource_group_name  = "RG32"
      virtual_network_name = "Spoke1"
      address_prefixes     = ["10.0.1.0/24"]
    },
    Spoke2_subnet = {
      name                 = "Spoke2_subnet"
      resource_group_name  = "RG32"
      virtual_network_name = "Spoke2"
      address_prefixes     = ["10.1.1.0/24"]
    },
     Spoke3_subnet = {
      name                 = "Spoke3_subnet"
      resource_group_name  = "RG32"
      virtual_network_name = "Spoke3"
      address_prefixes     = ["10.2.1.0/24"]
       },
     Spoke3_subnet = {
      name                 = "Hub_subnet"
      resource_group_name  = "RG32"
      virtual_network_name = "Hub"
      address_prefixes     = ["10.3.1.0/24"]
    }
  }
}

variable "prefix" {

  type      = string  
  default   = "TerraformLab"
} 

variable "hubnet" {

  type    = string
  default = "10.0.10.0/24"
}

variable "peering" {

  type = map(any)
  default = {
   
      "HubToSpok1"      =  ["10.0.0.0/16"],
      "Spoke1ToHub"     =  ["10.1.0.0/16"],
      "HubToSpoke2"     =  ["10.2.0.0/16"],
      "Spoke2ToHub"     =  ["10.3.0.0/16"],
      "HubToSpoke3"     =  ["10.0.0.0/16"],
      "Spoke3ToHub"     =  ["10.1.0.0/16"]
  }
}

variable "vnetlistname" {

      type = list(any)
      default = [
        "azurerm_virtual_network.Hub.name",
        "azurerm_virtual_network.Spoke1.name",
        "azurerm_virtual_network.Spoke2.name",
        "azurerm_virtual_network.Spoke3.name",
      ]
  
}

variable "vnetid" {

      type = list(any)
      default = [
        "azurerm_virtual_network.Spoke3.id",
        "azurerm_virtual_network.Spoke2.id",
        "azurerm_virtual_network.Spoke1.id",
        "azurerm_virtual_network.Hub.id"
      ]
  
}

variable "vnet_address_space" {
  default = [
    "10.0.0.0/16",
    "10.1.0.0/16",
  ]
}




