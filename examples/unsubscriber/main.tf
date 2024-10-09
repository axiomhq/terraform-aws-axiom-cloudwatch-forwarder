module "unsubscriber" {
  source               = "../../modules/unsubscriber"
  prefix               = "axiom-cloudwatch-forwarder"
  forwarder_lambda_arn = "Forwarder lambda ARN"
  log_groups_prefix    = "/aws/lambda/"
}
