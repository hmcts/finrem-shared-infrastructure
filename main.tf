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

# Slack alerts function app managed identity principal ID
# Can be provided via variable or uses hardcoded default for prod
# Hardcoded because pipeline service principal lacks access to subscription
# If function app is recreated, update this ID from: az functionapp identity show --name fr-slack-alerts-func --resource-group fr-slack-alerts-rg --query principalId -o tsv
locals {
  # Use variable if provided, otherwise use hardcoded prod value
  slack_alerts_principal_id = var.slack_alerts_principal_id != "" ? var.slack_alerts_principal_id : (
    var.env == "prod" ? "todo_put_in_hardcoded_value" : null
  )
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.product}-${var.env}"
  location = var.location

  tags = local.tags
}
