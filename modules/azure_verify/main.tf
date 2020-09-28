resource "null_resource" "verify_resource" {
    provisioner "local-exec" {
        command = "if [ $(az ${var.az_resource_command} ${var.resource_group_name}) == true ]; then $(echo -n '1' > ${var.verify_resource_file} ); else $(echo -n '0' > ${var.verify_resource_file} ); fi"
        interpreter = ["/bin/bash", "-c"]
        working_dir = "/tmp"
    }
}

# resource "null_resource" "verify_resource_grp" {
#     provisioner "local-exec" {
#         command = "echo -n \"$(if (Get-AzureRmResourceGroup -Name 'kube-resource' -ErrorAction SilentlyContinue) { 1 } else {0})\" > demo.txt"
#         interpreter = ["Powershell", "-Command"]
#     }
# }

data "local_file" "verify_file" {
    filename = "/tmp/${var.verify_resource_file}"
    depends_on = [null_resource.verify_resource]
}

output "azure_output" {
    value = data.local_file.verify_file
}