resource "aws_iam_role_policy_attachment" "cloudwatch_logs" {
  count      = var.enabled && var.iam_policy_attach ? 1 : 0
  role       = var.worker_iam_role_name
  policy_arn = data.aws_iam_policy.cloudwatch_logs.arn
}
