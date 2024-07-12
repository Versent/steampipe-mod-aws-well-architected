locals {
  well_architected_framework_cost11_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "cost-of-effort"
  })
}

benchmark "well_architected_framework_cost11" {
  title       = "COST11 How do you evaluate the cost of effort?"
  description = "Best practices for evaluating the cost of effort involve performing automation for operations to optimize efficiency and reduce manual workload."

  children = [
    benchmark.well_architected_framework_cost11_bp01
  ]

  tags = local.well_architected_framework_cost11_common_tags
}

benchmark "well_architected_framework_cost11_bp01" {
  title       = "COST11-BP01 Perform automation for operations"
  description = "Perform automation for operations to optimize efficiency and reduce manual workload, thus minimizing the cost of effort."

  children = [
    control.csv_well_architected_framework_cost11_bp01
  ]

  tags = merge(local.well_architected_framework_cost11_common_tags, {
    choice_id = "automation_for_operations",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_cost11_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST11-BP01'
    EOT
}
