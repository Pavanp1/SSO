output "permisssion_set_name" {
  description = "Name of permission set"
  value       = module.aws-account-assignment.name
}
output "group_assignments" {
  description = "List of groups who can access to the Permission Set."
  value       = module.aws-account-assignment.group_assignments
}