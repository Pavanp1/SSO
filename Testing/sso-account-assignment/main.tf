data "aws_ssoadmin_instances" "sandbox" {}

data "aws_ssoadmin_permission_set" "sandbox-readonly" {
  instance_arn = data.aws_ssoadmin_instances.sandbox.arns[0]
  name         = "AWS-SBX-ReadOnly-S3-full"
}

data "aws_identitystore_group" "example" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.sandbox.identity_store_ids)[0]

  filter {
    attribute_path  = "DisplayName"
    attribute_value = "test"
  }
}

resource "aws_ssoadmin_account_assignment" "example" {
  instance_arn       = data.aws_ssoadmin_permission_set.sandbox-readonly.instance_arn
  permission_set_arn = "arn:aws:sso:::permissionSet/ssoins-72235dea3eabb8f9/ps-078b53cb24ea4b9e"

  principal_id   = data.aws_identitystore_group.example.group_id
  principal_type = "GROUP"

  target_id   = "895407277468"
  target_type = "AWS_ACCOUNT"
}