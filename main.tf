module "sagemaker_role" {
  source = "./modules/iam"

  name       = "sagemaker"
  identifier = "sagemaker.amazonaws.com"
  policy     = data.aws_iam_policy_document.sagemaker_policy_doc.json
}

data "aws_iam_policy_document" "sagemaker_policy_doc" {
  statement {
    effect = "Allow"
    actions = [
      "sagemaker:CreateModel",
      "sagemaker:DescribeModel",
      "sagemaker:DeleteModel",
      "sagemaker:CreateEndpoint",
      "sagemaker:CreateEndpointConfig",
      "sagemaker:DescribeEndpoint",
      "sagemaker:DescribeEndpointConfig",
      "sagemaker:DeleteEndpoint"
    ]
    resources = ["arn:aws:sagemaker:${var.aws_region}:${data.aws_caller_identity.self.account_id}:*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::aws-machine-learning-blog/*"
    ]
  }
}

data "aws_caller_identity" "self" {}

module "sagemaker" {
  source = "./modules/sagemaker"

  model_name_a         = var.model_name_a
  model_role_arn_a     = module.sagemaker_role.iam_role_arn
  image_a              = var.image_a
  model_data_url_a     = var.model_data_url_a
  endpoint_config_name = var.endpoint_config_name
  endpoint_name        = var.endpoint_name
}
