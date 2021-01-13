resource "azurerm_key_vault" "kv" {
  name                       = join("", var.name_strings)
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = var.purge_protection_enabled

  sku_name = var.sku_name


  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption


  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get", "create", "update"
    ]

    secret_permissions = [
      "get", "set"
    ]

    storage_permissions = [
      "get", "set"
    ]
  }
}
