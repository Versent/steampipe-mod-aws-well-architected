locals {
  well_architected_framework_cost04_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "resource-decommissioning"
  })
}

benchmark "well_architected_framework_cost04" {
  title       = "COST4 How do you decommission resources?"
  description = "Implement change control and resource management from project inception to end-of-life. This ensures you shut down or terminate unused resources to reduce waste."

  children = [
    benchmark.well_architected_framework_cost04_bp01,
    benchmark.well_architected_framework_cost04_bp02,
    benchmark.well_architected_framework_cost04_bp03,
    benchmark.well_architected_framework_cost04_bp04,
    benchmark.well_architected_framework_cost04_bp05
  ]

  tags = local.well_architected_framework_cost04_common_tags
}

benchmark "well_architected_framework_cost04_bp01" {
  title       = "COST04-BP01 Track resources over their lifetime"
  description = "Track resources over their lifetime to ensure efficient use and timely decommissioning."

  children = [
    control.csv_well_architected_framework_cost04_bp01
  ]

  tags = merge(local.well_architected_framework_cost04_common_tags, {
    choice_id = "track_resources",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost04_bp02" {
  title       = "COST04-BP02 Implement a decommissioning process"
  description = "Implement a decommissioning process to manage the end-of-life of resources systematically."

  children = [
    control.csv_well_architected_framework_cost04_bp02
  ]

  tags = merge(local.well_architected_framework_cost04_common_tags, {
    choice_id = "decommissioning_process",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost04_bp03" {
  title       = "COST04-BP03 Decommission resources"
  description = "Decommission resources that are no longer needed to avoid unnecessary costs and optimize efficiency."

  children = [
    control.csv_well_architected_framework_cost04_bp03
  ]

  tags = merge(local.well_architected_framework_cost04_common_tags, {
    choice_id = "decommission_resources",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost04_bp04" {
  title       = "COST04-BP04 Decommission resources automatically"
  description = "Decommission resources automatically to ensure timely removal and reduce manual efforts."

  children = [
    control.csv_well_architected_framework_cost04_bp04
  ]

  tags = merge(local.well_architected_framework_cost04_common_tags, {
    choice_id = "automatic_decommissioning",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_cost04_bp05" {
  title       = "COST04-BP05 Enforce data retention policies"
  description = "Enforce data retention policies to ensure compliance and manage storage costs effectively."

  children = [
    control.csv_well_architected_framework_cost04_bp05
  ]

  tags = merge(local.well_architected_framework_cost04_common_tags, {
    choice_id = "data_retention_policies",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_cost04_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST04-BP01'
    EOT
}

control "csv_well_architected_framework_cost04_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST04-BP02'
    EOT
}

control "csv_well_architected_framework_cost04_bp03" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST04-BP03'
    EOT
}

control "csv_well_architected_framework_cost04_bp04" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST04-BP04'
    EOT
}

control "csv_well_architected_framework_cost04_bp05" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST04-BP05'
    EOT
}