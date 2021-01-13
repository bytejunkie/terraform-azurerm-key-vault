variable "name_separator" {
  description = "the character to use to separate the strings used to build the name - override with empty string if none required"
  type        = string
  default     = "-"
}

variable "name_strings" {
  description = "a list of strings to concatenate into a name - useful when templating a naming convention"
  type        = list(string)
}

variable "location" {
  description = "the location in which to deploy the resources"
  type        = string
}

variable "resource_group_name" {
  description = "the name of the resource group to place the resource in"
  type        = string
}

variable "sku_name" {
  description = "(Optional) The SKU name of the container registry."

  validation {
    condition     = var.sku_name == "standard" || var.sku_name == "premium"
    error_message = "Possible values are Standard and Premium."
  }

  default = "standard"
}

variable "enabled_for_deployment" {
  description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  default     = "false"
}

variable "enabled_for_template_deployment" {
  description = "(Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  default     = "false"
}

variable "enabled_for_disk_encryption" {
  description = "(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  default     = "false"
}

variable "purge_protection_enabled" {
  description = "(Optional) Is Purge Protection enabled for this Key Vault?"
  default     = "false"
}
