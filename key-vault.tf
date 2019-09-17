module "finrem-vault" {
  source = "git@github.com:hmcts/moj-module-key-vault?ref=master"
  name = "finrem-${var.env}"
  product = "${var.product}"
  env = "${var.env}"
  tenant_id = "${var.tenant_id}"
  object_id = "${var.jenkins_AAD_objectId}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  product_group_object_id = "94ac8962-b614-441b-aa4c-9be878a6bf17"
  managed_identity_object_id = "${var.managed_identity_object_id}"
  common_tags = "${local.common_tags}"
}

output "vaultName" {
  value = "${module.finrem-vault.key_vault_name}"
}
