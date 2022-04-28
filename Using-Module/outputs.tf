output "permisssion_set_name" {
  description = "Name of permission set"
  value       = module.aws-account-assignment.name
}
output "group_assignments" {
  description = "List of groups who can access to the Permission Set."
  value       = module.aws-account-assignment.group_assignments
}


output "arn" {
  description = "The Amazon Resource Name (ARN) of the Permission Set."
  value       = module.permission_set.arn
}

#output "instance_arn" {
#  description = "The Amazon Resource Name (ARN) of the SSO Instance."
#  value       = module.permission_set.instnace_arn
#}

output "session_duration" {
  description = "The length of time that the application user sessions are valid in the ISO-8601 standard."
  value       = module.permission_set.session_duration
}