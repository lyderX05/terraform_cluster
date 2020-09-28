variable "resource_group_name" {
    type=string
    description = "Azure AKS Cluster Resource Group Name"
}

variable "resource_group_location" {
    type=string
    description = "Azure AKS Cluster Resource Group Location"
}

variable "resource_call" {
    type=string
    default="1"
}