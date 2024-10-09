resource "axiom_dataset" "lambda_forwarder" {
  name        = "cloudwatch-lambda"
  description = "Test"
}

module "forwarder_example" {
  source        = "axiomhq/axiom-cloudwatch-forwarder/aws//modules/forwarder"
  axiom_dataset = axiom_dataset.lambda_forwarder.name
  axiom_token   = ""
  prefix        = "axiom-cloudwatch-forwarder"
}

module "subscriber_example" {
  source               = "axiomhq/axiom-cloudwatch-forwarder/aws//modules/subscriber"
  prefix               = "axiom-cloudwatch-forwarder"
  forwarder_lambda_arn = module.forwarder.lambda_arn
  log_groups_prefix    = "/aws/lambda/"
}

module "listener_example" {
  source               = "axiomhq/axiom-cloudwatch-forwarder/aws//modules/listener"
  prefix               = "axiom-cloudwatch-forwarder"
  forwarder_lambda_arn = module.forwarder.lambda_arn
  log_groups_prefix    = "/aws/lambda/"
}

output "log_group_names" {
  value = module.subscriber.log_groups_prefix
}
