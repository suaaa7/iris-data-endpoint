variable "model_name_a" {}

variable "model_role_arn_a" {}

variable "image_a" {}

variable "model_data_url_a" {}

variable "endpoint_config_name" {}

variable "endpoint_name" {}

resource "aws_sagemaker_model" "model_a" {
  name               = "${var.model_name_a}-${uuid()}"
  execution_role_arn = var.model_role_arn_a

  primary_container {
    image          = var.image_a
    model_data_url = var.model_data_url_a
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["name"]
  }
}

resource "aws_sagemaker_endpoint_configuration" "ec" {
  name = "${var.endpoint_config_name}-${uuid()}"

  production_variants {
    variant_name           = "variant-a"
    model_name             = aws_sagemaker_model.model_a.name
    instance_type          = "ml.t2.medium"
    initial_instance_count = 1
    initial_variant_weight = 1
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["name"]
  }

  #depends_on = [aws_sagemaker_model.model_a]
}

resource "aws_sagemaker_endpoint" "endpoint" {
  name                 = var.endpoint_name
  endpoint_config_name = aws_sagemaker_endpoint_configuration.ec.name

  #depends_on = [aws_sagemaker_endpoint_configuration.ec]
}

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 30"
  }

  triggers = {
    "before" = "${aws_sagemaker_endpoint.endpoint.id}"
  }
}
