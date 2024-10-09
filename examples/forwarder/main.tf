resource "axiom_dataset" "lambda_forwarder" {
  name        = "cloudwatch-lambda"
  description = "Test"
}

module "forwarder" {
  source        = "../../modules/forwarder"
  axiom_dataset = axiom_dataset.lambda_forwarder.name
  axiom_token   = ""
  prefix        = "axiom-cloudwatch-forwarder"
}

module "subscriber" {
  source               = "../../modules/subscriber"
  prefix               = "axiom-cloudwatch-tf-test"
  forwarder_lambda_arn = module.forwarder.lambda_arn
  log_groups_prefix    = "/aws/lambda/"
}

module "listener" {
  source               = "../../modules/listener"
  prefix               = "axiom-cloudwatch-tf-test"
  forwarder_lambda_arn = module.forwarder.lambda_arn
  log_groups_prefix    = "/aws/lambda/"
}

output "log_group_names" {
  value = module.subscriber.log_groups_prefix
}
