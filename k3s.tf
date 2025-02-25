resource "null_resource" "install_k3s" {
  provisioner "local-exec" {
    command = <<-EOT
      #!/bin/bash
      curl -sfL https://get.k3s.io | sh -
    EOT
  }
}
