variable "account_id" {
  description = "AWS account id. Mitigates risk of accidentally running Terraform against unexpected account."
}

#variable "permission_set_arn" {
#  description = "The ARN of the Permission Set that the admin wants to grant the principal access to."
#  type        = string
#}

variable "groups" {
  description = "List of names of Group entities who can access to the Permission Set."
  type        = list(string)
  default     = []
}