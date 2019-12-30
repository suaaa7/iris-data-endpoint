module "sagemaker_role" {
  source = "./modules/iam"

  name       = "sagemaker"
  identifier = "sagemaker.amazonaws.com"
  policy     = data.aws_iam_policy.sagemaker_role_policy.policy
}

data "aws_iam_policy" "sagemaker_role_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
}

module "sagemaker" {
  source = "./modules/sagemaker"

  model_name_a         = var.model_name_a
  model_role_arn_a     = module.sagemaker_role.iam_role_arn
  image_a              = var.image_a
  model_data_url_a     = var.model_data_url_a
  endpoint_config_name = var.endpoint_config_name
  endpoint_name        = var.endpoint_name
}
