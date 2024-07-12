locals {
  well_architected_framework_cost03_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "cost-monitoring"
  })
}

benchmark "well_architected_framework_cost03" {
  title       = "COST3 How do you monitor your cost and usage?"
  description = "Establish policies and procedures to monitor and appropriately allocate your costs. This permits you to measure and improve the cost efficiency of this workload."

  children = [
    benchmark.well_architected_framework_cost03_bp01,
    benchmark.well_architected_framework_cost03_bp02,
    benchmark.well_architected_framework_cost03_bp03,
    benchmark.well_architected_framework_cost03_bp04,
    benchmark.well_architected_framework_cost03_bp05,
    benchmark.well_architected_framework_cost03_bp06
  ]

  tags = local.well_architected_framework_cost03_common_tags
}

benchmark "well_architected_framework_cost03_bp01" {
  title       = "COST03-BP01 Configure detailed information sources"
  description = "Configure detailed information sources to gather accurate and comprehensive cost and usage data."

  children = [
    control.csv_well_architected_framework_cost03_bp01
  ]

  tags = merge(local.well_architected_framework_cost03_common_tags, {
    choice_id = "detailed_information_sources",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost03_bp02" {
  title       = "COST03-BP02 Add organization information to cost and usage"
  description = "Add organization information to cost and usage data to enhance analysis and reporting capabilities."

  children = [
    control.csv_well_architected_framework_cost03_bp02
  ]

  tags = merge(local.well_architected_framework_cost03_common_tags, {
    choice_id = "organization_information",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost03_bp03" {
  title       = "COST03-BP03 Identify cost attribution categories"
  description = "Identify cost attribution categories to allocate costs accurately across different parts of the organization."

  children = [
    control.csv_well_architected_framework_cost03_bp03
  ]

  tags = merge(local.well_architected_framework_cost03_common_tags, {
    choice_id = "cost_attribution_categories",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost03_bp04" {
  title       = "COST03-BP04 Establish organization metrics"
  description = "Establish organization metrics to measure and track cost efficiency and performance."

  children = [
    control.csv_well_architected_framework_cost03_bp04
  ]

  tags = merge(local.well_architected_framework_cost03_common_tags, {
    choice_id = "organization_metrics",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost03_bp05" {
  title       = "COST03-BP05 Configure billing and cost management tools"
  description = "Configure billing and cost management tools to monitor and control spending effectively."

  children = [
    control.csv_well_architected_framework_cost03_bp05
  ]

  tags = merge(local.well_architected_framework_cost03_common_tags, {
    choice_id = "billing_cost_management_tools",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost03_bp06" {
  title       = "COST03-BP06 Allocate costs based on workload metrics"
  description = "Allocate costs based on workload metrics to ensure accurate cost attribution and accountability."

  children = [
    control.csv_well_architected_framework_cost03_bp06
  ]

  tags = merge(local.well_architected_framework_cost03_common_tags, {
    choice_id = "allocate_costs_workload_metrics",
    risk      = "Low"
  })
}

# Controls
control "csv_well_architected_framework_cost03_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST03-BP01'
    EOT
}

control "csv_well_architected_framework_cost03_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST03-BP02'
    EOT
}

control "csv_well_architected_framework_cost03_bp03" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST03-BP03'
    EOT
}

control "csv_well_architected_framework_cost03_bp04" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST03-BP04'
    EOT
}

control "csv_well_architected_framework_cost03_bp05" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST03-BP05'
    EOT
}

control "csv_well_architected_framework_cost03_bp06" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST03-BP06'
    EOT
}