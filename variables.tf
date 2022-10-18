variable "tenant_id" {
  sensitive = true
}

variable "subscription_id" {
  sensitive = true
}

variable "client_id" {
  sensitive = true
}

variable "client_secret" {
  sensitive = true
}

variable "location" {
  description = "Location for all resources in Azure"
  default = "Canada Central"
}

variable "resource_group_name" {
  description = "Ressource group name"
}

variable "aks_name" {
  description = "AKS cluster name"
  default = "default-cluster"
}

variable "aks_default_node_pool_vm_size" {
  default = "Standard_D2_v2"
}

variable "aks_default_node_pool_name" {
  default = "default"
}

variable "aks_default_node_pool_size" {
  type = number
  default = 3
}

variable "container_registry_name" {}

variable "container_registry_resource_group_name" {
  #default var.resource_group_name
}

variable "container_registry_sku" {
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium"
  default = "Basic"
}

variable "container_registry_activate_admin_user" {
  description = "Specifies whether the admin user is enabled"
  type = bool
  default = false
}


variable "letsencrypt_email" {
  description = "Email use for Let's Encrypt to communicate expiration notices"
}