
# terraform-aws-ecr

This project is **100% Open Source**, build and develop by DevOps Team from [Qlos.com](https://qlos.com)
## About
Terraform module to create private or public [Amazon ECR)](https://aws.amazon.com/ecr/) repository.

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

```text
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Source: <https://opensource.org/licenses/MIT>
```
See [LICENSE](LICENSE) for full details.
## Authors
- Rafał Masiarek | [email](mailto:rafal.masiarek@qlos.com)

<!-- BEGIN_TF_DOCS -->
## Documentation


### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [aws_ecr_repository_policy.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [aws_ecrpublic_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecrpublic_repository) | resource |
| [aws_iam_policy_document.empty](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.resource_full_access_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.resource_full_access_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.resource_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.resource_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.resource_readonly_access_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.resource_readonly_access_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable"></a> [enable](#input\_enable) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_enable_private_ecr"></a> [enable\_private\_ecr](#input\_enable\_private\_ecr) | Set to false to prevent the module from creating any resources. | `bool` | `false` | no |
| <a name="input_enable_public_ecr"></a> [enable\_public\_ecr](#input\_enable\_public\_ecr) | Set to false to prevent the module from creating any resources. | `bool` | `false` | no |
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | The encryption type for the repository. Must be one of: `KMS` or `AES256`. Defaults to `AES256` | `string` | `"KMS"` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. | `string` | `"IMMUTABLE"` | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | The ARN of the KMS key to use when encryption\_type is `KMS`. If not specified, uses the default AWS managed key for ECR | `string` | `null` | no |
| <a name="input_max_image_count"></a> [max\_image\_count](#input\_max\_image\_count) | How many Docker Image versions AWS ECR will store. | `number` | `10` | no |
| <a name="input_max_untagged_image_count"></a> [max\_untagged\_image\_count](#input\_max\_untagged\_image\_count) | How many Untagged Docker Image versions AWS ECR will store. | `number` | `1` | no |
| <a name="input_principals_full_access"></a> [principals\_full\_access](#input\_principals\_full\_access) | Principal ARN to provide with full access to the ECR. | `list(any)` | `[]` | no |
| <a name="input_principals_readonly_access"></a> [principals\_readonly\_access](#input\_principals\_readonly\_access) | Principal ARN to provide with readonly access to the ECR. | `list(any)` | `[]` | no |
| <a name="input_public_repository_catalog_data"></a> [public\_repository\_catalog\_data](#input\_public\_repository\_catalog\_data) | Catalog data configuration for the repository | `any` | `{}` | no |
| <a name="input_repository_force_delete"></a> [repository\_force\_delete](#input\_repository\_force\_delete) | If `true`, will delete the repository even if it contains images. Defaults to `false` | `bool` | `false` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name to use for the repository.<br>The repository name may be specified on its own (such as `nginx-web-app`) or it can be prepended with a namespace to group the repository into a category (such as `project-a/nginx-web-app`).<br>If you don't specify a name, CFNlong generates a unique physical ID and uses that ID for the repository name. For more information, see Name type.<br>The repository name must start with a letter and can only contain lowercase letters, numbers, hyphens, underscores, and forward slashes.<br>If you specify a name, you cannot perform updates that require replacement of this resource.<br>You can perform updates that require no or some interruption.<br>If you must replace the resource, specify a new name. | `string` | `""` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags map for resources | `map(string)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Timeouts map. | `map(any)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Registry ARN. |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | Registry ID. |
| <a name="output_registry_url"></a> [registry\_url](#output\_registry\_url) | Registry URL. |
| <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name) | Registry name. |

<!-- END_TF_DOCS -->
