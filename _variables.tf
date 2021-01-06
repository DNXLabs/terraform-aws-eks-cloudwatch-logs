variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled."
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
}

variable "region" {
  type	      = string
  description = "The region for Fluent Bit Cloudwatch Logs"
}

variable "cluster_identity_oidc_issuer" {
  type        = string
  description = "The OIDC Identity issuer for the cluster."
}

variable "cluster_identity_oidc_issuer_arn" {
  type        = string
  description = "The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account."
}

variable "helm_chart_name" {
  type        = string
  default     = "aws-for-fluent-bit"
  description = "Install Fluent Bit to send logs from containers to CloudWatch Logs"
}

variable "helm_chart_release_name" {
  type        = string
  default     = "aws-for-fluent-bit"
  description = "Fluent Bit Helm release name."
}

variable "helm_chart_repo" {
  type        = string
  default     = "https://aws.github.io/eks-charts"
  description = "Fluent Bit Helm repository name."
}

variable "helm_chart_version" {
  type        = string
  default     = "0.1.5"
  description = "Fluent Bit Helm chart version."
}

variable "create_namespace" {
  type        = bool
  default     = false
  description = "Whether to create Kubernetes namespace with name defined by `namespace`."
}

variable "namespace" {
  type        = string
  default     = "amazon-cloudwatch"
  description = "Kubernetes namespace to deploy Fluent Bit Helm chart."
}

variable "service_account_name" {
  type        = string
  default     = "aws-for-fluent-bit"
  description = "Fluent Bit service account name."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

variable "worker_iam_role_name" {
  type        = string
  description = "IAM role name for EKS worker groups."
}
