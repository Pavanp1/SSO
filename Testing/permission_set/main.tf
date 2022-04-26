data "aws_ssoadmin_instances" "sandbox" {}

resource "aws_ssoadmin_permission_set" "sandbox-readonly" {
  name             = "AWS-SBX-ReadOnly-S3-full"
  description      = "Permission Set for readonly access to sandbox account"
  instance_arn     = tolist(data.aws_ssoadmin_instances.sandbox.arns)[0]
  relay_state      = " "
  session_duration = "PT2H"
  tags = {
    Name = "AWS-SBX-ReadOnly-S3-full"
    Created_by = "Pavan"
    Managed_by = "Terraform"
  }
}
resource "aws_ssoadmin_managed_policy_attachment" "sandbox-readonly" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.sandbox.arns)[0]
  #managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess" for adding mutiple policy arn
  permission_set_arn = aws_ssoadmin_permission_set.sandbox-readonly.arn
  for_each  = toset(["arn:aws:iam::aws:policy/ReadOnlyAccess","arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"])
  managed_policy_arn = each.key
}

data "aws_iam_policy_document" "s3-full" {
  statement {
    sid = "1"

    actions = [
      "s3:*"

    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}
resource "aws_ssoadmin_permission_set_inline_policy" "AWS-S3-full" {
  inline_policy      = data.aws_iam_policy_document.s3-full.json
  instance_arn       = aws_ssoadmin_permission_set.sandbox-readonly.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.sandbox-readonly.arn
}