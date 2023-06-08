resource "helm_release" "cloudwatch_logs" {
  depends_on = [var.mod_dependency, kubernetes_namespace.cloudwatch_logs]
  count      = var.enabled ? 1 : 0
  name       = var.helm_chart_name
  chart      = var.helm_chart_release_name
  repository = var.helm_chart_repo
  version    = var.helm_chart_version
  namespace  = var.namespace

  set {
    name  = "serviceAccount.name"
    value = var.service_account_name
  }
  set {
    name  = "cloudWatchLogs.region"
    value = var.region
  }

  set {
    name  = "cloudWatchLogs.logGroupTemplate"
    value = "/aws/eks/${var.cluster_name}/$(kubernetes['labels']['app.kubernetes.io/name'])"
  }

  set {
    name  = "firehose.enabled"
    value = var.firehose_enabled
  }

  set {
    name  = "kinesis.enabled"
    value = var.kinesis_enabled
  }

  set {
    name  = "elasticsearch.enabled"
    value = var.elasticsearch_enabled
  }

  values = [
    yamlencode(var.settings)
  ]
}
