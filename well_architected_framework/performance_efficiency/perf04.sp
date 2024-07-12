locals {
  well_architected_framework_perf04_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "networking-efficiency"
  })
}

benchmark "well_architected_framework_perf04" {
  title       = "PERF4 How do you select and configure networking resources in your workload?"
  description = "The optimal networking solution for a workload varies based on latency, throughput requirements, jitter, and bandwidth. Physical constraints, such as user or on-premises resources, determine location options. These constraints can be offset with edge locations or resource placement."

  children = [
    benchmark.well_architected_framework_perf04_bp01,
    benchmark.well_architected_framework_perf04_bp02,
    benchmark.well_architected_framework_perf04_bp03,
    benchmark.well_architected_framework_perf04_bp04,
    benchmark.well_architected_framework_perf04_bp05,
    benchmark.well_architected_framework_perf04_bp06,
    benchmark.well_architected_framework_perf04_bp07
  ]

  tags = local.well_architected_framework_perf04_common_tags
}

benchmark "well_architected_framework_perf04_bp01" {
  title       = "PERF04-BP01 Understand how networking impacts performance"
  description = "Understand how networking impacts performance to make informed decisions about your network architecture."

  children = [
    control.csv_well_architected_framework_perf04_bp01
  ]

  tags = merge(local.well_architected_framework_perf04_common_tags, {
    choice_id = "networking_impact",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf04_bp02" {
  title       = "PERF04-BP02 Evaluate available networking features"
  description = "Evaluate available networking features to select the most suitable options for your workload."

  children = [
    control.csv_well_architected_framework_perf04_bp02
  ]

  tags = merge(local.well_architected_framework_perf04_common_tags, {
    choice_id = "evaluate_network_features",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf04_bp03" {
  title       = "PERF04-BP03 Choose appropriate dedicated connectivity or VPN for your workload"
  description = "Choose appropriate dedicated connectivity or VPN for your workload to ensure secure and reliable network connections."

  children = [
    control.csv_well_architected_framework_perf04_bp03
  ]

  tags = merge(local.well_architected_framework_perf04_common_tags, {
    choice_id = "dedicated_connectivity",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf04_bp04" {
  title       = "PERF04-BP04 Use load balancing to distribute traffic across multiple resources"
  description = "Use load balancing to distribute traffic across multiple resources and improve availability and performance."

  children = [
    control.csv_well_architected_framework_perf04_bp04
  ]

  tags = merge(local.well_architected_framework_perf04_common_tags, {
    choice_id = "load_balancing",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf04_bp05" {
  title       = "PERF04-BP05 Choose network protocols to improve performance"
  description = "Choose network protocols to improve performance and reduce latency."

  children = [
    control.csv_well_architected_framework_perf04_bp05
  ]

  tags = merge(local.well_architected_framework_perf04_common_tags, {
    choice_id = "network_protocols",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf04_bp06" {
  title       = "PERF04-BP06 Choose your workload's location based on network requirements"
  description = "Choose your workload's location based on network requirements to optimize performance and minimize latency."

  children = [
    control.csv_well_architected_framework_perf04_bp06
  ]

  tags = merge(local.well_architected_framework_perf04_common_tags, {
    choice_id = "location_based_on_network",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf04_bp07" {
  title       = "PERF04-BP07 Optimize network configuration based on metrics"
  description = "Optimize network configuration based on metrics to ensure optimal performance and efficiency."

  children = [
    control.csv_well_architected_framework_perf04_bp07
  ]

  tags = merge(local.well_architected_framework_perf04_common_tags, {
    choice_id = "optimize_network_configuration",
    risk      = "Low"
  })
}

# Controls
control "csv_well_architected_framework_perf04_bp01" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF04-BP01'
    EOT
}

control "csv_well_architected_framework_perf04_bp02" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF04-BP02'
    EOT
}

control "csv_well_architected_framework_perf04_bp03" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF04-BP03'
    EOT
}

control "csv_well_architected_framework_perf04_bp04" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF04-BP04'
    EOT
}

control "csv_well_architected_framework_perf04_bp05" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF04-BP05'
    EOT
}

control "csv_well_architected_framework_perf04_bp06" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF04-BP06'
    EOT
}

control "csv_well_architected_framework_perf04_bp07" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF04-BP07'
    EOT
}