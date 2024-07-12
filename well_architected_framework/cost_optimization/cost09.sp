locals {
  well_architected_framework_cost09_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "demand-supply-management"
  })
}

benchmark "well_architected_framework_cost09" {
  title       = "COST9 How do you manage demand, and supply resources?"
  description = "For a workload that has balanced spend and performance, verify that everything you pay for is used and avoid significantly underutilizing instances. A skewed utilization metric in either direction has an adverse impact on your organization, in either operational costs (degraded performance due to over-utilization), or wasted AWS expenditures (due to over-provisioning)."

  children = [
    benchmark.well_architected_framework_cost09_bp01,
    benchmark.well_architected_framework_cost09_bp02,
    benchmark.well_architected_framework_cost09_bp03
  ]

  tags = local.well_architected_framework_cost09_common_tags
}

benchmark "well_architected_framework_cost09_bp01" {
  title       = "COST09-BP01 Perform an analysis on the workload demand"
  description = "Perform an analysis on the workload demand to understand and predict the resource requirements."

  children = [
    control.csv_well_architected_framework_cost09_bp01
  ]

  tags = merge(local.well_architected_framework_cost09_common_tags, {
    choice_id = "workload_demand_analysis",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost09_bp02" {
  title       = "COST09-BP02 Implement a buffer or throttle to manage demand"
  description = "Implement a buffer or throttle to manage demand and prevent over-utilization or under-utilization of resources."

  children = [
    control.csv_well_architected_framework_cost09_bp02
  ]

  tags = merge(local.well_architected_framework_cost09_common_tags, {
    choice_id = "buffer_throttle_demand",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost09_bp03" {
  title       = "COST09-BP03 Supply resources dynamically"
  description = "Supply resources dynamically to adjust to changing workload demands and optimize cost efficiency."

  children = [
    control.csv_well_architected_framework_cost09_bp03
  ]

  tags = merge(local.well_architected_framework_cost09_common_tags, {
    choice_id = "dynamic_resource_supply",
    risk      = "Low"
  })
}

# Controls
control "csv_well_architected_framework_cost09_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST09-BP01'
    EOT
}

control "csv_well_architected_framework_cost09_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST09-BP02'
    EOT
}

control "csv_well_architected_framework_cost09_bp03" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST09-BP03'
    EOT
}
