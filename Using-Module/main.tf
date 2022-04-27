#module "permission_set" {
#  source = "github.com/Pavanp1/ZRE-SSO.git//modules/AWS-SSO/Permission_set?ref=v1.0.1"
#
#  name = "AWS-final-permission-set"
#  description = "ec2 instance creation access"
#  #session_duration = " "
#  relay_state =  ""
#  inline_policy = ""
#  managed_policies = ["arn:aws:iam::aws:policy/AWSDirectConnectReadOnlyAccess","arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"]
#  tags = {
#    Name = "testing module final"
#    created = "terraform-final"
#  }
#
#}
#data "aws_iam_policy_document" "ec2full-custom-policy" {
#  source_policy_documents = [file("${path.module}/policy1.json")]
#}

module "aws-account-assignment" {
  #source = "git::https://github.com/tedilabs/terraform-aws-account.git//modules/sso-account-assignment?ref=v0.19.0"
  source = "github.com/Pavanp1/ZRE-SSO.git//modules/AWS-SSO/sso-account-assignment?ref=v1.0.3"

  account_id = "895407277468"
  groups= ["test","New-test"]
  permission_set_arn = "arn:aws:sso:::permissionSet/ssoins-72235dea3eabb8f9/ps-cc8c1c3c27b753c8"
}