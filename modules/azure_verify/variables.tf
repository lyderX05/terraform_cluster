variable "verify_resource_file" {
    type = string
    default = "res_grp"
}

variable "resource_group_name" {
    type=string
    description = "Azure AKS Cluster Resource Group Name"
}

variable "az_resource_command" {
    type = string
    description = "Provide the command to be added for call of verification"
}