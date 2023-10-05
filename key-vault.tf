module "finrem-vault" {
  source                     = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name                       = "finrem-${var.env}"
  product                    = var.product
  env                        = var.env
  tenant_id                  = var.tenant_id
  object_id                  = var.jenkins_AAD_objectId
  resource_group_name        = azurerm_resource_group.rg.name
  product_group_name         = "dcd_divorce"
  managed_identity_object_id = var.managed_identity_object_id
  create_managed_identity    = true
  common_tags                = local.tags
}

output "vaultName" {
  value = module.finrem-vault.key_vault_name
}
