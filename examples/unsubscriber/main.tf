module "unsubscriber_example" {
  source               = "axiomhq/axiom-cloudwatch-forwarder/aws//modules/unsubscriber"
  prefix               = "axiom-cloudwatch-forwarder"
  forwarder_lambda_arn = "Forwarder lambda ARN"
  log_groups_prefix    = "/aws/lambda/"
}
