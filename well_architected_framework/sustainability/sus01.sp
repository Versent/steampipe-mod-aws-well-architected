locals {
  well_architected_framework_sus01_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "region-selection"
  })
}

benchmark "well_architected_framework_sus01" {
  title       = "SUS1 How do you select Regions for your workload?"
  description = "The choice of Region for your workload significantly affects its KPIs, including performance, cost, and carbon footprint. To effectively improve these KPIs, you should choose Regions for your workloads based on both business requirements and sustainability goals."

  children = [
    benchmark.well_architected_framework_sus01_bp01
  ]

  tags = local.well_architected_framework_sus01_common_tags
}

benchmark "well_architected_framework_sus01_bp01" {
  title       = "SUS01-BP01 Choose Region based on both business requirements and sustainability goals"
  description = "Choose Region based on both business requirements and sustainability goals to optimize performance, cost, and carbon footprint."

  children = [
    control.csv_well_architected_framework_sus01_bp01
  ]

  tags = merge(local.well_architected_framework_sus01_common_tags, {
    choice_id = "region_based_selection",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_sus01_bp01" {
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
      pillar = 'sustainability' AND best_practise = 'SUS01-BP01'
    EOT
}
