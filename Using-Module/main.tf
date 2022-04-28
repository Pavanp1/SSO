module "permission_set" {
  source = "github.com/Pavanp1/ZRE-SSO.git//modules/AWS-SSO/Permission_set?ref=v1.0.1"

  name = "AWS-ELB-Full-Autoscalling-full"
  description = "ELB full access and auto scalling full access"
  #session_duration = " "
  relay_state =  ""
#  inline_policy = " "
  managed_policies = ["arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess","arn:aws:iam::aws:policy/AutoScalingFullAccess"]
  tags = {
    Name = "full-ELB-Autoscalling-full"
    created = "wpt team"
  }

}
#data "aws_iam_policy_document" "ec2full-custom-policy" {
#  source_policy_documents = [file("${path.module}/policy1.json")]
#}

module "aws-account-assignment" {
  #source = "git::https://github.com/tedilabs/terraform-aws-account.git//modules/sso-account-assignment?ref=v0.19.0"
  source = "github.com/Pavanp1/ZRE-SSO.git//modules/AWS-SSO/sso-account-assignment?ref=v1.0.3"

  account_id = "767391508558"
  groups= ["test","New-test"] # We can put as many as groups to assign the same permission to single aws account
  depends_on = [module.permission_set]
  permission_set_arn = module.permission_set.arn
}