variable "product" {
  default = "finrem"
}

variable "location" {
  default = "UK South"
}

variable "appinsights_location" {
  default     = "UK South"
  description = "Location for Application Insights"
}

variable "env" {}

variable "application_type" {
  default     = "web"
  description = "Type of Application Insights (Web/Other)"
}

variable "tenant_id" {
  description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. This is usually sourced from environemnt variables and not normally required to be specified."
}

variable "jenkins_AAD_objectId" {
  description = "(Required) The Azure AD object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
}

variable "common_tags" {
  type = map(string)
}

variable "team_contact" {
  default = "#finrem-dev"
}

variable "managed_identity_object_id" {
  default = ""
}

variable "aks_subscription_id" {}

variable "slack_alerts_principal_id" {
  description = "Managed identity principal ID of the slack alerts function app. Only needed in prod."
  type        = string
  default     = ""
}
