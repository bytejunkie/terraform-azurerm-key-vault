provider "azurerm" {
  features {}
}

resource "random_pet" "pet" {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
  }
  separator = ""

}
#################
# pre-requisites
#################

module "resourcegroup" {
  source = "bytejunkie/resource-group/azurerm"

  #location       = "west europe"
  name_strings   = ["byt", "rsg", random_pet.pet.id]
  name_separator = "-"

  #   tags = var.tags
}

module "key_vault" {
  source = "../.."

  name_strings        = ["byt", "kva", random_pet.pet.id]
  location            = "west europe"
  resource_group_name = module.resourcegroup.resource_group_name

  purge_protection_enabled = "false"

  enabled_for_deployment          = "true"
  enabled_for_template_deployment = "true"
  enabled_for_disk_encryption     = "true"

}
