resource "azurerm_resource_group" "aks_resource_group" {
    count = var.resource_call == "0" ? 1 : 0
    name = var.resource_group_name
    location = var.resource_group_location
}

data "azurerm_resource_group" "aks_resource_group_data" {
    count = var.resource_call == "1" ? 1 : 0
    name = var.resource_group_name
}
