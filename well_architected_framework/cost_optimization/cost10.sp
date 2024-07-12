locals {
  well_architected_framework_cost10_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "service-evaluation"
  })
}

benchmark "well_architected_framework_cost10" {
  title       = "COST10 How do you evaluate new services?"
  description = "As AWS releases new services and features, it's a best practice to review your existing architectural decisions to verify they continue to be the most cost effective."

  children = [
    benchmark.well_architected_framework_cost10_bp01,
    benchmark.well_architected_framework_cost10_bp02
  ]

  tags = local.well_architected_framework_cost10_common_tags
}

benchmark "well_architected_framework_cost10_bp01" {
  title       = "COST10-BP01 Develop a workload review process"
  description = "Develop a workload review process to ensure that new services and features are evaluated for cost-effectiveness."

  children = [
    control.csv_well_architected_framework_cost10_bp01
  ]

  tags = merge(local.well_architected_framework_cost10_common_tags, {
    choice_id = "workload_review_process",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost10_bp02" {
  title       = "COST10-BP02 Review and analyze this workload regularly"
  description = "Review and analyze this workload regularly to ensure it continues to be cost-effective and takes advantage of new services and features."

  children = [
    control.csv_well_architected_framework_cost10_bp02
  ]

  tags = merge(local.well_architected_framework_cost10_common_tags, {
    choice_id = "regular_workload_review",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_cost10_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST10-BP01'
    EOT
}

control "csv_well_architected_framework_cost10_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST10-BP02'
    EOT
}
