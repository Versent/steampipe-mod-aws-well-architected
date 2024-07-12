locals {
  well_architected_framework_cost01_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "cloud-financial-management"
  })
}

benchmark "well_architected_framework_cost01" {
  title       = "COST1 How do you implement cloud financial management?"
  description = "Implementing Cloud Financial Management helps organizations realize business value and financial success as they optimize their cost and usage and scale on AWS."

  children = [
    benchmark.well_architected_framework_cost01_bp01,
    benchmark.well_architected_framework_cost01_bp02,
    benchmark.well_architected_framework_cost01_bp03,
    benchmark.well_architected_framework_cost01_bp04,
    benchmark.well_architected_framework_cost01_bp05,
    benchmark.well_architected_framework_cost01_bp06,
    benchmark.well_architected_framework_cost01_bp07,
    benchmark.well_architected_framework_cost01_bp08,
    benchmark.well_architected_framework_cost01_bp09
  ]

  tags = local.well_architected_framework_cost01_common_tags
}

benchmark "well_architected_framework_cost01_bp01" {
  title       = "COST01-BP01 Establish ownership of cost optimization"
  description = "Establish ownership of cost optimization to ensure accountability and continuous focus on cost efficiency."

  children = [
    control.csv_well_architected_framework_cost01_bp01
  ]

  tags = merge(local.well_architected_framework_cost01_common_tags, {
    choice_id = "ownership_cost_optimization",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost01_bp02" {
  title       = "COST01-BP02 Establish a partnership between finance and technology"
  description = "Establish a partnership between finance and technology to align financial goals with technological strategies."

  children = [
    control.csv_well_architected_framework_cost01_bp02
  ]

  tags = merge(local.well_architected_framework_cost01_common_tags, {
    choice_id = "finance_technology_partnership",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost01_bp03" {
  title       = "COST01-BP03 Establish cloud budgets and forecasts"
  description = "Establish cloud budgets and forecasts to plan and control cloud spending effectively."

  children = [
    control.csv_well_architected_framework_cost01_bp03
  ]

  tags = merge(local.well_architected_framework_cost01_common_tags, {
    choice_id = "cloud_budgets_forecasts",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost01_bp04" {
  title       = "COST01-BP04 Implement cost awareness in your organizational processes"
  description = "Implement cost awareness in your organizational processes to encourage cost-efficient practices."

  children = [
    control.csv_well_architected_framework_cost01_bp04
  ]

  tags = merge(local.well_architected_framework_cost01_common_tags, {
    choice_id = "cost_awareness",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost01_bp05" {
  title       = "COST01-BP05 Report and notify on cost optimization"
  description = "Report and notify on cost optimization to maintain transparency and drive continuous improvement."

  children = [
    control.csv_well_architected_framework_cost01_bp05
  ]

  tags = merge(local.well_architected_framework_cost01_common_tags, {
    choice_id = "report_notify_cost_optimization",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_cost01_bp06" {
  title       = "COST01-BP06 Monitor cost proactively"
  description = "Monitor cost proactively to detect and address inefficiencies promptly."

  children = [
    control.csv_well_architected_framework_cost01_bp06
  ]

  tags = merge(local.well_architected_framework_cost01_common_tags, {
    choice_id = "proactive_cost_monitoring",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost01_bp07" {
  title       = "COST01-BP07 Keep up-to-date with new service releases"
  description = "Keep up-to-date with new service releases to leverage the latest cost-saving features and improvements."

  children = [
    control.csv_well_architected_framework_cost01_bp07
  ]

  tags = merge(local.well_architected_framework_cost01_common_tags, {
    choice_id = "new_service_releases",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost01_bp08" {
  title       = "COST01-BP08 Create a cost-aware culture"
  description = "Create a cost-aware culture to embed cost optimization into the fabric of your organization."

  children = [
    control.csv_well_architected_framework_cost01_bp08
  ]

  tags = merge(local.well_architected_framework_cost01_common_tags, {
    choice_id = "cost_aware_culture",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_cost01_bp09" {
  title       = "COST01-BP09 Quantify business value from cost optimization"
  description = "Quantify business value from cost optimization to demonstrate the impact of cost-saving measures."

  children = [
    control.csv_well_architected_framework_cost01_bp09
  ]

  tags = merge(local.well_architected_framework_cost01_common_tags, {
    choice_id = "quantify_business_value",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_cost01_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST01-BP01'
    EOT
}

control "csv_well_architected_framework_cost01_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST01-BP02'
    EOT
}

control "csv_well_architected_framework_cost01_bp03" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST01-BP03'
    EOT
}

control "csv_well_architected_framework_cost01_bp04" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST01-BP04'
    EOT
}

control "csv_well_architected_framework_cost01_bp05" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST01-BP05'
    EOT
}

control "csv_well_architected_framework_cost01_bp06" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST01-BP06'
    EOT
}

control "csv_well_architected_framework_cost01_bp07" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST01-BP07'
    EOT
}

control "csv_well_architected_framework_cost01_bp08" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST01-BP08'
    EOT
}

control "csv_well_architected_framework_cost01_bp09" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST01-BP09'
    EOT
}