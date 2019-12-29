variable "aws_region" {
  default = "us-east-1"
}

variable "model_name_a" {
  default = "A"
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
