# Terraform Azure/AWS/Alibaba Customizable Module

This module allow to verify the resource exits if, yes so nothing is created otherwise create the resource.

Prerequistes:
- Need to azure cli install in terraform execution server (For Azure Cloud) 
    - [Installation Documentation](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
- Need to aws cli install in terraform execution server (For AWS Cloud)
- Need to aliyun cli install in terraform execution server (For Alibaba Cloud)


Most Required variable is resource_type
1) resource_type for call of sepcific Cloud environment

**Note**: Need to Call Verify Module before calling the resource module.

Execution Command:
`
terraform init

terraform plan -target module.azure_kube_verify

terraform apply -target module.azure_kube_verify

terrafrom plan

terraform apply
`


### Under Development:
AWS and Alibaba Specifics and Azure Cluster Specifics