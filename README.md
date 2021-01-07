# terraform-aws-eks-cloudwatch-logs


[![Lint Status](https://github.com/DNXLabs/terraform-aws-eks-cloudwatch-logs/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-eks-cloudwatch-logs/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-eks-cloudwatch-logs)](https://github.com/DNXLabs/terraform-aws-eks-cloudwatch-logs/blob/master/LICENSE)

Terraform module for deploying AWS Fluent Bit as a daemonSet to send logs to CloudWatch Logs [aws-for-fluent-bit](https://hub.helm.sh/charts/aws/aws-for-fluent-bit) inside a pre-existing EKS cluster.

## Usage

```
module "cloudwatch_logs" {
  source = "git::https://github.com/DNXLabs/terraform-aws-eks-cloudwatch-logs.git"

  enabled = true

  cluster_name                     = module.eks_cluster.cluster_id
  cluster_identity_oidc_issuer     = module.eks_cluster.cluster_oidc_issuer_url
  cluster_identity_oidc_issuer_arn = module.eks_cluster.oidc_provider_arn
  worker_iam_role_name             = module.eks_cluster.worker_iam_role_name
  region                           = data.aws_region.current.name
}
```

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.13, < 4.0 |
| helm | >= 1.0, < 1.4.0 |
| kubernetes | >= 1.10.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.13, < 4.0 |
| helm | >= 1.0, < 1.4.0 |
| kubernetes | >= 1.10.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_identity\_oidc\_issuer | The OIDC Identity issuer for the cluster. | `string` | n/a | yes |
| cluster\_identity\_oidc\_issuer\_arn | The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account. | `string` | n/a | yes |
| cluster\_name | The name of the cluster. | `string` | n/a | yes |
| region|The region for Fluent Bit Cloudwatch Logs. | `string` | `us-east-1` | no |
| create\_namespace | Whether to create Kubernetes namespace with name defined by `namespace`. | `bool` | `false` | no |
| enabled | Variable indicating whether deployment is enabled. | `bool` | `true` | no |
| helm\_chart\_name | Fluent Bit Helm chart name. | `string` | `"aws-for-fluent-bit"` | no |
| helm\_chart\_release\_name | Fluent Bit Helm release name. | `string` | `"aws-for-fluent-bit"` | no |
| helm\_chart\_repo | Fluent Bit Helm repository name. | `string` | `"https://aws.github.io/eks-charts"` | no |
| helm\_chart\_version | Fluent Bit Helm chart version. | `string` | `"0.1.5"` | no |
| mod\_dependency | Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable. | `any` | `null` | no |
| namespace | Kubernetes namespace to deploy Fluent Bit Helm chart. | `string` | `"amazon-cloudwatch"` | no |
| service\_account\_name | aws-for-fluent-bit service account name. | `string` | `"aws-for-fluent-bit"` | no |
| worker\_iam\_role\_name | IAM role name for EKS worker groups. | `string` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-eks-cloudwatch-logs/blob/master/LICENSE) for full details.
