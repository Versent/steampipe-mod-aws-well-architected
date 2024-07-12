locals {
  well_architected_framework_perf02_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "compute-efficiency"
  })
}

benchmark "well_architected_framework_perf02" {
  title       = "PERF2 How do you select and use compute resources in your workload?"
  description = "The optimal compute choice for a particular workload can vary based on application design, usage patterns, and configuration settings. Architectures may use different compute choices for various components and allow different features to improve performance. Selecting the wrong compute choice for an architecture can lead to lower performance efficiency."

  children = [
    benchmark.well_architected_framework_perf02_bp01,
    benchmark.well_architected_framework_perf02_bp02,
    benchmark.well_architected_framework_perf02_bp03,
    benchmark.well_architected_framework_perf02_bp04,
    benchmark.well_architected_framework_perf02_bp05,
    benchmark.well_architected_framework_perf02_bp06
  ]

  tags = local.well_architected_framework_perf02_common_tags
}

benchmark "well_architected_framework_perf02_bp01" {
  title       = "PERF02-BP01 Select the best compute options for your workload"
  description = "Select the best compute options for your workload to ensure optimal performance and cost-efficiency."

  children = [
    control.csv_well_architected_framework_perf02_bp01
  ]

  tags = merge(local.well_architected_framework_perf02_common_tags, {
    choice_id = "select_best_compute",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf02_bp02" {
  title       = "PERF02-BP02 Understand the available compute configuration and features"
  description = "Understand the available compute configuration and features to leverage the most suitable options for your workload."

  children = [
    control.csv_well_architected_framework_perf02_bp02
  ]

  tags = merge(local.well_architected_framework_perf02_common_tags, {
    choice_id = "understand_compute_features",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf02_bp03" {
  title       = "PERF02-BP03 Collect compute-related metrics"
  description = "Collect compute-related metrics to monitor performance and make data-driven decisions."

  children = [
    control.csv_well_architected_framework_perf02_bp03
  ]

  tags = merge(local.well_architected_framework_perf02_common_tags, {
    choice_id = "collect_metrics",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf02_bp04" {
  title       = "PERF02-BP04 Configure and right-size compute resources"
  description = "Configure and right-size compute resources to match workload requirements and optimize cost-efficiency."

  children = [
    control.csv_well_architected_framework_perf02_bp04
  ]

  tags = merge(local.well_architected_framework_perf02_common_tags, {
    choice_id = "right_size_resources",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf02_bp05" {
  title       = "PERF02-BP05 Scale your compute resources dynamically"
  description = "Scale your compute resources dynamically to adapt to changing workload demands."

  children = [
    control.csv_well_architected_framework_perf02_bp05
  ]

  tags = merge(local.well_architected_framework_perf02_common_tags, {
    choice_id = "dynamic_scaling",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf02_bp06" {
  title       = "PERF02-BP06 Use optimized hardware-based compute accelerators"
  description = "Use optimized hardware-based compute accelerators to enhance performance for specific workloads."

  children = [
    control.csv_well_architected_framework_perf02_bp06
  ]

  tags = merge(local.well_architected_framework_perf02_common_tags, {
    choice_id = "use_compute_accelerators",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_perf02_bp01" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF02-BP01'
    EOT
}

control "csv_well_architected_framework_perf02_bp02" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF02-BP02'
    EOT
}

control "csv_well_architected_framework_perf02_bp03" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF02-BP03'
    EOT
}

control "csv_well_architected_framework_perf02_bp04" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF02-BP04'
    EOT
}

control "csv_well_architected_framework_perf02_bp05" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF02-BP05'
    EOT
}

control "csv_well_architected_framework_perf02_bp06" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF02-BP06'
    EOT
}