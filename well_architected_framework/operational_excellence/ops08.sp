locals {
  well_architected_framework_ops08_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "ops-workload-observability"
  })
}

benchmark "well_architected_framework_ops08" {
  title       = "OPS08 How do you utilize workload observability in your organization?"
  description = "Ensure optimal workload health by leveraging observability. Utilize relevant metrics, logs, and traces to gain a comprehensive view of your workload's performance and address issues efficiently."

  children = [
    benchmark.well_architected_framework_ops08_bp01,
    benchmark.well_architected_framework_ops08_bp02,
    benchmark.well_architected_framework_ops08_bp03,
    benchmark.well_architected_framework_ops08_bp04,
    benchmark.well_architected_framework_ops08_bp05
  ]

  tags = local.well_architected_framework_ops08_common_tags
}

benchmark "well_architected_framework_ops08_bp01" {
  title       = "OPS08-BP01 Analyze workload metrics"
  description = "Collect and analyze key metrics to understand the performance and health of your workload."

  children = [
    control.csv_well_architected_framework_ops08_bp01
  ]

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_analyze_metrics"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops08_bp02" {
  title       = "OPS08-BP02 Analyze workload logs"
  description = "Analyze logs to identify and troubleshoot issues, understand user behavior, and improve system performance."

  children = [
    control.csv_well_architected_framework_ops08_bp02
  ]

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_analyze_logs"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops08_bp03" {
  title       = "OPS08-BP03 Analyze workload traces"
  description = "Utilize tracing to track the flow of requests and diagnose performance bottlenecks within your workload."

  children = [
    control.csv_well_architected_framework_ops08_bp03
  ]

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_analyze_traces"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops08_bp04" {
  title       = "OPS08-BP04 Create actionable alerts"
  description = "Develop alerts that notify you of significant events or threshold breaches, enabling timely intervention and remediation."

  children = [
    control.csv_well_architected_framework_ops08_bp04
  ]

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_actionable_alerts"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops08_bp05" {
  title       = "OPS08-BP05 Create dashboards"
  description = "Build dashboards that provide at-a-glance insights into key metrics, logs, and traces to monitor workload health and performance."

  children = [
    control.csv_well_architected_framework_ops08_bp05
  ]

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_create_dashboards"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_ops08_bp01" {
  title = "Customer Response"

  sql = <<EOT
    select
      reason,
      resource,
      status,
      region
    from
      war
    where
      pillar = 'operational-excellence' AND best_practise = 'OPS08-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_analyze_metrics"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops08_bp02" {
  title = "Customer Response"

  sql = <<EOT
    select
      reason,
      resource,
      status,
      region
    from
      war
    where
      pillar = 'operational-excellence' AND best_practise = 'OPS08-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_analyze_logs"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops08_bp03" {
  title = "Customer Response"

  sql = <<EOT
    select
      reason,
      resource,
      status,
      region
    from
      war
    where
      pillar = 'operational-excellence' AND best_practise = 'OPS08-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_analyze_traces"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops08_bp04" {
  title = "Customer Response"

  sql = <<EOT
    select
      reason,
      resource,
      status,
      region
    from
      war
    where
      pillar = 'operational-excellence' AND best_practise = 'OPS08-BP04'
    EOT

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_actionable_alerts"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops08_bp05" {
  title = "Customer Response"

  sql = <<EOT
    select
      reason,
      resource,
      status,
      region
    from
      war
    where
      pillar = 'operational-excellence' AND best_practise = 'OPS08-BP05'
    EOT

  tags = merge(local.well_architected_framework_ops08_common_tags, {
    choice_id = "ops_create_dashboards"
    risk      = "High"
  })
}