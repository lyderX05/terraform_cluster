variable "resource_type" {
    type=string
    description = "Resource Type should be either aws or azure"
    validation {
        condition = can(regex("^(aws|azure|alibaba)$", var.resource_type))
        error_message = "Incorrect Resource type should be either aws or azure."
    }
}

variable "resource_group_name" {
    type=object({
     value = string
     resource_type = string 
    })
    description = "Azure AKS Cluster Resource Group Name"
    validation {
        condition = var.resource_group_name.value == "" && var.resource_group_name.resource_type == "azure"
        error_message = "Incorrect Resource group Name it should be "" when resource_type is not azure."
    }
    default = {
        value = ""
        resource_type = "azure"
    }
}

variable "resource_group_location" {
    type=object({
     value = string
     resource_type = string 
    })
    description = "Azure AKS Cluster Resource Group Location"
    validation {
        condition = var.resource_group_location.value == "" && var.resource_group_location.resource_type == "azure"
        error_message = "Incorrect Resource group Name it should be "" when resource_type is not azure."
    }
    default = {
        value = ""
        resource_type = "azure"
    }

}