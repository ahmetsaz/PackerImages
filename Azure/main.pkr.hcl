source "azure-arm" "azure-shared-image" {

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret

  managed_image_resource_group_name = var.image_resource_group_name
  managed_image_name                = var.image_name

  os_type         = var.os_type
  image_publisher = var.image_publisher
  image_offer     = var.image_offer
  image_sku       = var.image_sku


  location = var.vm_location
  vm_size  = var.vm_size


}

build {
  sources = ["sources.azure-arm.azure-shared-image"]

  provisioner "shell" {
    environment_vars = [
    "DOCKER_VERSION=${var.docker_version}"]
    script = "../Provisioners/dockerinstall.sh"
  }
}