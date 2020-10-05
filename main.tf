provider "azurerm" {
  features {}
}

locals {
  tags = "${merge(var.common_tags,
    map("Team Contact", "${var.team_contact}")
    )}"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.product}-${var.env}"
  location = var.location

  tags = local.tags
}

data "azurerm_user_assigned_identity" "finrem-identity" {
  name                = "finrem-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}