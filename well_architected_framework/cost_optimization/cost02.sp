locals {
  well_architected_framework_cost02_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "cost-governance"
  })
}

benchmark "well_architected_framework_cost02" {
  title       = "COST2 How do you govern usage?"
  description = "Establish policies and mechanisms to verify that appropriate costs are incurred while objectives are achieved. By employing a checks-and-balances approach, you can innovate without overspending."

  children = [
    benchmark.well_architected_framework_cost02_bp01,
    benchmark.well_architected_framework_cost02_bp02,
    benchmark.well_architected_framework_cost02_bp03,
    benchmark.well_architected_framework_cost02_bp04,
    benchmark.well_architected_framework_cost02_bp05,
    benchmark.well_architected_framework_cost02_bp06
  ]

  tags = local.well_architected_framework_cost02_common_tags
}

benchmark "well_architected_framework_cost02_bp01" {
  title       = "COST02-BP01 Develop policies based on your organization requirements"
  description = "Develop policies based on your organization requirements to ensure that costs are aligned with business objectives."

  children = [
    control.csv_well_architected_framework_cost02_bp01
  ]

  tags = merge(local.well_architected_framework_cost02_common_tags, {
    choice_id = "develop_policies",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost02_bp02" {
  title       = "COST02-BP02 Implement goals and targets"
  description = "Implement goals and targets to drive cost optimization and track progress."

  children = [
    control.csv_well_architected_framework_cost02_bp02
  ]

  tags = merge(local.well_architected_framework_cost02_common_tags, {
    choice_id = "implement_goals_targets",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost02_bp03" {
  title       = "COST02-BP03 Implement an account structure"
  description = "Implement an account structure to organize and manage costs effectively across different projects and teams."

  children = [
    control.csv_well_architected_framework_cost02_bp03
  ]

  tags = merge(local.well_architected_framework_cost02_common_tags, {
    choice_id = "account_structure",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost02_bp04" {
  title       = "COST02-BP04 Implement groups and roles"
  description = "Implement groups and roles to manage access and control costs based on user responsibilities."

  children = [
    control.csv_well_architected_framework_cost02_bp04
  ]

  tags = merge(local.well_architected_framework_cost02_common_tags, {
    choice_id = "groups_roles",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost02_bp05" {
  title       = "COST02-BP05 Implement cost controls"
  description = "Implement cost controls to ensure that spending is aligned with budgets and goals."

  children = [
    control.csv_well_architected_framework_cost02_bp05
  ]

  tags = merge(local.well_architected_framework_cost02_common_tags, {
    choice_id = "cost_controls",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost02_bp06" {
  title       = "COST02-BP06 Track project lifecycle"
  description = "Track project lifecycle to manage costs effectively from inception to completion."

  children = [
    control.csv_well_architected_framework_cost02_bp06
  ]

  tags = merge(local.well_architected_framework_cost02_common_tags, {
    choice_id = "track_lifecycle",
    risk      = "Low"
  })
}

# Controls
control "csv_well_architected_framework_cost02_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST02-BP01'
    EOT
}

control "csv_well_architected_framework_cost02_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST02-BP02'
    EOT
}

control "csv_well_architected_framework_cost02_bp03" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST02-BP03'
    EOT
}

control "csv_well_architected_framework_cost02_bp04" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST02-BP04'
    EOT
}

control "csv_well_architected_framework_cost02_bp05" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST02-BP05'
    EOT
}

control "csv_well_architected_framework_cost02_bp06" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST02-BP06'
    EOT
}