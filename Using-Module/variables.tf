variable "account_id" {
  description = "AWS account id. Mitigates risk of accidentally running Terraform against unexpected account."
}

variable "region" {
  description = "AWS region"
  default = "us-east-1"
}
#
#variable "tags" {
#  type = object({
#    Service     = string
#    Environment = string
#    CreatedBy   = string
#    Team        = string
#    Implementer = string
#    Project     = string
#  })
#  description = "Map of tags that can be applied to all the AWS resources."
#}

#variable "permission_set_arn" {
#  description = "The ARN of the Permission Set that the admin wants to grant the principal access to."
#  type        = string
#}

#variable "groups" {
#  description = "List of names of Group entities who can access to the Permission Set."
#  type        = list(string)
#  default     = []
#}
#variable "sso_member_account_id" {
#  description = "Member SSO account ID on which permission set needs to be attached"
#  type = string
#}
#variable "permission_set_arn" {
#  description = "Existing permission set arn which needs to be attached to Member sso account"
#  type = string
#
#
#}
#variable "group_name" {
#  description = "AD group Name which needs to be associted with Member sso account"
#  type = string
#}
#
#variable "permission_set_name" {
#  description = "Name of the existing permission set which needs to be attached to the memeber sso account"
#  type = string
#
#}