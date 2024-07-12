locals {
  well_architected_framework_perf03_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "data-management"
  })
}

benchmark "well_architected_framework_perf03" {
  title       = "PERF3 How do you store, manage, and access data in your workload?"
  description = "The optimal data management solution for a particular system varies based on the kind of data type (block, file, or object), access patterns (random or sequential), required throughput, frequency of access (online, offline, archival), frequency of update (WORM, dynamic), and availability and durability constraints. Well-Architected workloads use purpose-built data stores which allow different features to improve performance."

  children = [
    benchmark.well_architected_framework_perf03_bp01,
    benchmark.well_architected_framework_perf03_bp02,
    benchmark.well_architected_framework_perf03_bp03,
    benchmark.well_architected_framework_perf03_bp04,
    benchmark.well_architected_framework_perf03_bp05
  ]

  tags = local.well_architected_framework_perf03_common_tags
}

benchmark "well_architected_framework_perf03_bp01" {
  title       = "PERF03-BP01 Use a purpose-built data store that best supports your data access and storage requirements"
  description = "Use a purpose-built data store that best supports your data access and storage requirements to optimize performance and efficiency."

  children = [
    control.csv_well_architected_framework_perf03_bp01
  ]

  tags = merge(local.well_architected_framework_perf03_common_tags, {
    choice_id = "purpose_built_data_store",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf03_bp02" {
  title       = "PERF03-BP02 Evaluate available configuration options for data store"
  description = "Evaluate available configuration options for data store to ensure optimal performance and cost-effectiveness."

  children = [
    control.csv_well_architected_framework_perf03_bp02
  ]

  tags = merge(local.well_architected_framework_perf03_common_tags, {
    choice_id = "evaluate_configuration_options",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf03_bp03" {
  title       = "PERF03-BP03 Collect and record data store performance metrics"
  description = "Collect and record data store performance metrics to monitor and optimize performance."

  children = [
    control.csv_well_architected_framework_perf03_bp03
  ]

  tags = merge(local.well_architected_framework_perf03_common_tags, {
    choice_id = "collect_performance_metrics",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf03_bp04" {
  title       = "PERF03-BP04 Implement strategies to improve query performance in data store"
  description = "Implement strategies to improve query performance in data store to enhance efficiency and speed."

  children = [
    control.csv_well_architected_framework_perf03_bp04
  ]

  tags = merge(local.well_architected_framework_perf03_common_tags, {
    choice_id = "improve_query_performance",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf03_bp05" {
  title       = "PERF03-BP05 Implement data access patterns that utilize caching"
  description = "Implement data access patterns that utilize caching to reduce latency and improve data retrieval speed."

  children = [
    control.csv_well_architected_framework_perf03_bp05
  ]

  tags = merge(local.well_architected_framework_perf03_common_tags, {
    choice_id = "data_access_caching",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_perf03_bp01" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF03-BP01'
    EOT
}

control "csv_well_architected_framework_perf03_bp02" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF03-BP02'
    EOT
}

control "csv_well_architected_framework_perf03_bp03" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF03-BP03'
    EOT
}

control "csv_well_architected_framework_perf03_bp04" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF03-BP04'
    EOT
}

control "csv_well_architected_framework_perf03_bp05" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF03-BP05'
    EOT
}