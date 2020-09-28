# provider "azurerm" {  
#   count = var.cred_type == "nonenv" ? 1 : 0
#   version = "=2.20.0"
#   subscription_id = var.azure_cred.subscription_id
#   client_id = var.azure_cred.client_id
#   tenant_id = var.azure_cred.tenant_id
#   client_secret = var.azure_cred.client_secret
#   features {}

# }

provider "azurerm" {  
  version = "=2.20.0"
  features {}
}


module "azure_kube_verify" {
  count = var.resource_type == "azure" ? 1 : 0
  source = "./modules/azure_verify"
  resource_group_name = var.resource_group_name
  az_resource_command = "group exists --resource-group"
  verify_resource_file = "res_grp"
}

module "azure_kube_deployment" {
  source = "./modules/azure_create"
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  resource_call = module.azure_kube_verify[0].azure_output.content
  depends_on = [module.azure_kube_verify]
}

# resource "azurerm_resource_group" "aks_resource_grp" {
#     name = var.
# }