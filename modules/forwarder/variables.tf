variable "prefix" {
  type        = string
  description = "Prefix for resources, defaults to axiom-cloudwatch"
  default     = "axiom-cloudwatch"
}

variable "lambda_zip_bucket" {
  type        = string
  description = "Name of the S3 bucket where Lambda code is stored"
  default     = "axiom-cloudformation"
}

variable "lambda_zip_version" {
  type        = string
  description = "Version of the Axiom Lambda"
  default     = "1.3.0"
}

variable "axiom_dataset" {
  type        = string
  description = "Axiom dataset to forward logs to"
}

variable "axiom_token" {
  type        = string
  description = "Axiom token for the dataset"
}

variable "axiom_url" {
  type        = string
  description = "Axiom's API URL"
  default     = "https://api.axiom.co"
}

variable "axiom_edge" {
  type        = string
  description = "Regional edge domain for ingestion (e.g., eu-central-1.aws.edge.axiom.co). When set, data is sent to https://{edge}/v1/ingest/{dataset}."
  default     = ""
}

variable "axiom_edge_url" {
  type        = string
  description = "Explicit edge URL for ingest operations. If a path is provided, the URL is used as-is. If no path is provided, /v1/ingest/{dataset} is appended. Takes precedence over axiom_edge."
  default     = ""
}

variable "cloudwatch_log_retention" {
  type        = number
  description = "CloudWatch log group retention in days"
  default     = 1
}

variable "data_tags" {
  type        = map(string)
  description = "Custom tags to add to all logs forwarded to Axiom"
  default     = {}
}

