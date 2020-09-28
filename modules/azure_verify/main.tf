# This Resource verify if the specific resource exists or not if, yes then it will file with the status
# File name will be: {variable verify_resource_file}
resource "null_resource" "verify_resource" {
    provisioner "local-exec" {
        command = "if [ $(az ${var.az_resource_command} ${var.resource_group_name}) == true ]; then $(echo -n '1' > ${var.verify_resource_file} ); else $(echo -n '0' > ${var.verify_resource_file} ); fi"
        interpreter = ["/bin/bash", "-c"]
        working_dir = "/tmp"
    }
}

data "local_file" "verify_file" {
    filename = "/tmp/${var.verify_resource_file}"
    depends_on = [null_resource.verify_resource]
}

output "azure_output" {
    value = data.local_file.verify_file
}