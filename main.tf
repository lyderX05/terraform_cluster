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
