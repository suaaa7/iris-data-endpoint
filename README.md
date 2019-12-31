# iris-data-endpoint
 Build a serverless front-end for Amazon SageMaker endpoints with Terraform

## Usage

### terraform apply

```
$ terraform init
$ make apply
```

### curl

`base_url` is `aws_api_gateway_deployment.gw_deployment.invoke_url`

```
$ bash request.sh <base_url>
{"code": 200, "variant": "variant-a", "prediction": "virginica"}
```

### terraform destroy

```
$ make destroy
```

## Reference

[Amazon SageMaker エンドポイント用のサーバーレスフロントエンドを構築する](https://aws.amazon.com/jp/blogs/news/build-a-serverless-frontend-for-an-amazon-sagemaker-endpoint/)

[Build a serverless frontend for an Amazon SageMaker endpoint](http://www.aible.ca/build-a-serverless-frontend-for-an-amazon-sagemaker-endpoint/)
