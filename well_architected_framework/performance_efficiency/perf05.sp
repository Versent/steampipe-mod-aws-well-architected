locals {
  well_architected_framework_perf05_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "organizational-performance-efficiency"
  })
}

benchmark "well_architected_framework_perf05" {
  title       = "PERF5 How do your organizational practices and culture contribute to performance efficiency in your workload?"
  description = "When architecting workloads, there are principles and practices that you can adopt to help you better run efficient high-performing cloud workloads. To adopt a culture that fosters performance efficiency of cloud workloads, consider these key principles and practices:"

  children = [
    benchmark.well_architected_framework_perf05_bp01,
    benchmark.well_architected_framework_perf05_bp02,
    benchmark.well_architected_framework_perf05_bp03,
    benchmark.well_architected_framework_perf05_bp04,
    benchmark.well_architected_framework_perf05_bp05,
    benchmark.well_architected_framework_perf05_bp06,
    benchmark.well_architected_framework_perf05_bp07
  ]

  tags = local.well_architected_framework_perf05_common_tags
}

benchmark "well_architected_framework_perf05_bp01" {
  title       = "PERF05-BP01 Establish key performance indicators (KPIs) to measure workload health and performance"
  description = "Establish key performance indicators (KPIs) to measure workload health and performance to ensure alignment with business objectives."

  children = [
    control.csv_well_architected_framework_perf05_bp01
  ]

  tags = merge(local.well_architected_framework_perf05_common_tags, {
    choice_id = "establish_kpis",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf05_bp02" {
  title       = "PERF05-BP02 Use monitoring solutions to understand the areas where performance is most critical"
  description = "Use monitoring solutions to understand the areas where performance is most critical and to gain insights into potential bottlenecks."

  children = [
    control.csv_well_architected_framework_perf05_bp02
  ]

  tags = merge(local.well_architected_framework_perf05_common_tags, {
    choice_id = "use_monitoring_solutions",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf05_bp03" {
  title       = "PERF05-BP03 Define a process to improve workload performance"
  description = "Define a process to improve workload performance to ensure continuous optimization and efficiency."

  children = [
    control.csv_well_architected_framework_perf05_bp03
  ]

  tags = merge(local.well_architected_framework_perf05_common_tags, {
    choice_id = "improve_workload_performance",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf05_bp04" {
  title       = "PERF05-BP04 Load test your workload"
  description = "Load test your workload to understand its behavior under stress and to identify potential performance issues."

  children = [
    control.csv_well_architected_framework_perf05_bp04
  ]

  tags = merge(local.well_architected_framework_perf05_common_tags, {
    choice_id = "load_test_workload",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_perf05_bp05" {
  title       = "PERF05-BP05 Use automation to proactively remediate performance-related issues"
  description = "Use automation to proactively remediate performance-related issues to maintain optimal performance and reduce manual intervention."

  children = [
    control.csv_well_architected_framework_perf05_bp05
  ]

  tags = merge(local.well_architected_framework_perf05_common_tags, {
    choice_id = "automation_for_remediation",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_perf05_bp06" {
  title       = "PERF05-BP06 Keep your workload and services up-to-date"
  description = "Keep your workload and services up-to-date to leverage the latest performance improvements and security features."

  children = [
    control.csv_well_architected_framework_perf05_bp06
  ]

  tags = merge(local.well_architected_framework_perf05_common_tags, {
    choice_id = "keep_services_updated",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_perf05_bp07" {
  title       = "PERF05-BP07 Review metrics at regular intervals"
  description = "Review metrics at regular intervals to track performance trends and to identify areas for improvement."

  children = [
    control.csv_well_architected_framework_perf05_bp07
  ]

  tags = merge(local.well_architected_framework_perf05_common_tags, {
    choice_id = "review_metrics_regularly",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_perf05_bp01" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF05-BP01'
    EOT
}

control "csv_well_architected_framework_perf05_bp02" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF05-BP02'
    EOT
}

control "csv_well_architected_framework_perf05_bp03" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF05-BP03'
    EOT
}

control "csv_well_architected_framework_perf05_bp04" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF05-BP04'
    EOT
}

control "csv_well_architected_framework_perf05_bp05" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF05-BP05'
    EOT
}

control "csv_well_architected_framework_perf05_bp06" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF05-BP06'
    EOT
}

control "csv_well_architected_framework_perf05_bp07" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF05-BP07'
    EOT
}