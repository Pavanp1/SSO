#output "name" {
#  description = "The name of the Account Assignment."
#  value       = local.metadata.name
#}

output "account_id" {
  description = "The identifier of an AWS account."
  value       = var.account_id
}

output "permission_set" {
  description = "The Amazon Resource Name (ARN) of the Permission Set"
  value       = data.aws_ssoadmin_permission_set.sandbox-readonly.arn
}

output "instance_arn" {
  description = "The Amazon Resource Name (ARN) of the SSO Instance."
  value       = data.aws_ssoadmin_permission_set.sandbox-readonly.instance_arn
}

output "identity_store_id" {
  description = "The ID of SSO Identity Store."
  value       = data.aws_ssoadmin_instances.sandbox.identity_store_ids
}

output "group_assignments" {
  description = "List of groups who can access to the Permission Set."
  value = [
  for name, group in aws_ssoadmin_account_assignment.example : {
    id   = data.aws_identitystore_group.example.group_id
    name = name
  }
  ]
}