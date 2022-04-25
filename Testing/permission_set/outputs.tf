output "name" {
  description = "The name of the Permission Set."
  value       = aws_ssoadmin_permission_set.sandbox-readonly.name
}

output "arn" {
  description = "The Amazon Resource Name (ARN) of the Permission Set."
  value       = aws_ssoadmin_permission_set.sandbox-readonly.arn
}

output "instance_arn" {
  description = "The Amazon Resource Name (ARN) of the SSO Instance."
  value       = aws_ssoadmin_permission_set.sandbox-readonly.instance_arn
}

output "session_duration" {
  description = "The length of time that the application user sessions are valid in the ISO-8601 standard."
  value       = aws_ssoadmin_permission_set.sandbox-readonly.session_duration
}