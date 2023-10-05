provider "azurerm" {
  features {}
}

locals {
  tags = merge(var.common_tags,
    tomap({
      "Team Contact" = "${var.team_contact}"
    })
  )
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.product}-${var.env}"
  location = var.location

  tags = local.tags
}

resource "azurerm_key_vault_secret" "definition-importer-username" {
   name = "definition-importer-username"
   value = "definition-importer-username-placeholder"
   key_vault_id = module.finrem-vault.key_vault_id
}

resource "azurerm_key_vault_secret" "definition-importer-password" {
   name = "definition-importer-password"
   value = "definition-importer-password-placeholder"
   key_vault_id = module.finrem-vault.key_vault_id
}