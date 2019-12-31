variable "aws_region" {
  default = "us-east-1"
}

variable "function_name" {
  default = "iris-data-lambda"
}

variable "api_gateway_name" {
  default = "iris-data-api-gateway"
}

variable "model_name_a" {
  default = "iris-data-model-a"
}

variable "image_a" {
  default = "305705277353.dkr.ecr.us-east-1.amazonaws.com/decision-trees-sample:latest"
}

variable "model_data_url_a" {
  default = "s3://aws-machine-learning-blog/artifacts/decision-trees/model.tar.gz"
}

variable "endpoint_config_name" {
  default = "iris-data-endpoint-config"
}

variable "endpoint_name" {
  default = "iris-data-endpoint"
}
