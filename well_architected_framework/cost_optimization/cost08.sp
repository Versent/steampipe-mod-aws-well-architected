locals {
  well_architected_framework_cost08_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "data-transfer-costs"
  })
}

benchmark "well_architected_framework_cost08" {
  title       = "COST8 How do you plan for data transfer charges?"
  description = "Verify that you plan and monitor data transfer charges so that you can make architectural decisions to minimize costs. A small yet effective architectural change can drastically reduce your operational costs over time."

  children = [
    benchmark.well_architected_framework_cost08_bp01,
    benchmark.well_architected_framework_cost08_bp02,
    benchmark.well_architected_framework_cost08_bp03
  ]

  tags = local.well_architected_framework_cost08_common_tags
}

benchmark "well_architected_framework_cost08_bp01" {
  title       = "COST08-BP01 Perform data transfer modeling"
  description = "Perform data transfer modeling to understand and predict the costs associated with data movement."

  children = [
    control.csv_well_architected_framework_cost08_bp01
  ]

  tags = merge(local.well_architected_framework_cost08_common_tags, {
    choice_id = "data_transfer_modeling",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost08_bp02" {
  title       = "COST08-BP02 Select components to optimize data transfer cost"
  description = "Select components to optimize data transfer cost to ensure cost efficiency in data movement."

  children = [
    control.csv_well_architected_framework_cost08_bp02
  ]

  tags = merge(local.well_architected_framework_cost08_common_tags, {
    choice_id = "optimize_data_transfer",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost08_bp03" {
  title       = "COST08-BP03 Implement services to reduce data transfer costs"
  description = "Implement services to reduce data transfer costs to minimize expenses related to data movement."

  children = [
    control.csv_well_architected_framework_cost08_bp03
  ]

  tags = merge(local.well_architected_framework_cost08_common_tags, {
    choice_id = "reduce_data_transfer_costs",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_cost08_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST08-BP01'
    EOT
}

control "csv_well_architected_framework_cost08_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST08-BP02'
    EOT
}

control "csv_well_architected_framework_cost08_bp03" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST08-BP03'
    EOT
}
