locals {
  well_architected_framework_cost07_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "pricing-models"
  })
}

benchmark "well_architected_framework_cost07" {
  title       = "COST7 How do you use pricing models to reduce cost?"
  description = "Use the pricing model that is most appropriate for your resources to minimize expense."

  children = [
    benchmark.well_architected_framework_cost07_bp01,
    benchmark.well_architected_framework_cost07_bp02,
    benchmark.well_architected_framework_cost07_bp03,
    benchmark.well_architected_framework_cost07_bp04,
    benchmark.well_architected_framework_cost07_bp05
  ]

  tags = local.well_architected_framework_cost07_common_tags
}

benchmark "well_architected_framework_cost07_bp01" {
  title       = "COST07-BP01 Perform pricing model analysis"
  description = "Perform pricing model analysis to identify the most cost-effective pricing options for your resources."

  children = [
    control.csv_well_architected_framework_cost07_bp01
  ]

  tags = merge(local.well_architected_framework_cost07_common_tags, {
    choice_id = "pricing_model_analysis",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost07_bp02" {
  title       = "COST07-BP02 Choose Regions based on cost"
  description = "Choose Regions based on cost to take advantage of regional pricing differences."

  children = [
    control.csv_well_architected_framework_cost07_bp02
  ]

  tags = merge(local.well_architected_framework_cost07_common_tags, {
    choice_id = "region_based_cost",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost07_bp03" {
  title       = "COST07-BP03 Select third-party agreements with cost-efficient terms"
  description = "Select third-party agreements with cost-efficient terms to minimize expenses."

  children = [
    control.csv_well_architected_framework_cost07_bp03
  ]

  tags = merge(local.well_architected_framework_cost07_common_tags, {
    choice_id = "third_party_agreements",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost07_bp04" {
  title       = "COST07-BP04 Implement pricing models for all components of this workload"
  description = "Implement pricing models for all components of this workload to optimize costs."

  children = [
    control.csv_well_architected_framework_cost07_bp04
  ]

  tags = merge(local.well_architected_framework_cost07_common_tags, {
    choice_id = "pricing_models",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_cost07_bp05" {
  title       = "COST07-BP05 Perform pricing model analysis at the management account level"
  description = "Perform pricing model analysis at the management account level to ensure cost optimization across the organization."

  children = [
    control.csv_well_architected_framework_cost07_bp05
  ]

  tags = merge(local.well_architected_framework_cost07_common_tags, {
    choice_id = "management_account_analysis",
    risk      = "Low"
  })
}

# Controls
control "csv_well_architected_framework_cost07_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST07-BP01'
    EOT
}

control "csv_well_architected_framework_cost07_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST07-BP02'
    EOT
}

control "csv_well_architected_framework_cost07_bp03" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST07-BP03'
    EOT
}

control "csv_well_architected_framework_cost07_bp04" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST07-BP04'
    EOT
}

control "csv_well_architected_framework_cost07_bp05" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST07-BP05'
    EOT
}
