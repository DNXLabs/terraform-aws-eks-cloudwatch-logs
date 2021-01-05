data "aws_iam_policy" "cloudwatch_metrics" {
  arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}