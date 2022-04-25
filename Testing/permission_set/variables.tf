variable "account_id" {
  description = "AWS account id. Mitigates risk of accidentally running Terraform against unexpected account."
}

variable "region" {
  description = "AWS region"
}

variable "tags" {
  type = object({
    Service     = string
    Environment = string
    CreatedBy   = string
    Team        = string
    Implementer = string
    Project     = string
  })
  description = "Map of tags that can be applied to all the AWS resources."
}