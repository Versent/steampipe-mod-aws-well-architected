locals {
  well_architected_framework_cost06_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "cost-targets"
  })
}

benchmark "well_architected_framework_cost06" {
  title       = "COST6 How do you meet cost targets when you select resource type, size and number?"
  description = "Verify that you choose the appropriate resource size and number of resources for the task at hand. You minimize waste by selecting the most cost effective type, size, and number."

  children = [
    benchmark.well_architected_framework_cost06_bp01,
    benchmark.well_architected_framework_cost06_bp02,
    benchmark.well_architected_framework_cost06_bp03,
    benchmark.well_architected_framework_cost06_bp04
  ]

  tags = local.well_architected_framework_cost06_common_tags
}

benchmark "well_architected_framework_cost06_bp01" {
  title       = "COST06-BP01 Perform cost modeling"
  description = "Perform cost modeling to understand the financial implications of different resource choices."

  children = [
    control.csv_well_architected_framework_cost06_bp01
  ]

  tags = merge(local.well_architected_framework_cost06_common_tags, {
    choice_id = "perform_cost_modeling",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost06_bp02" {
  title       = "COST06-BP02 Select resource type, size, and number based on data"
  description = "Select resource type, size, and number based on data to ensure cost efficiency and suitability for the workload."

  children = [
    control.csv_well_architected_framework_cost06_bp02
  ]

  tags = merge(local.well_architected_framework_cost06_common_tags, {
    choice_id = "data_based_selection",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost06_bp03" {
  title       = "COST06-BP03 Select resource type, size, and number automatically based on metrics"
  description = "Select resource type, size, and number automatically based on metrics to optimize resource usage dynamically."

  children = [
    control.csv_well_architected_framework_cost06_bp03
  ]

  tags = merge(local.well_architected_framework_cost06_common_tags, {
    choice_id = "automatic_selection",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_cost06_bp04" {
  title       = "COST06-BP04 Consider using shared resources"
  description = "Consider using shared resources to reduce costs by leveraging economies of scale."

  children = [
    control.csv_well_architected_framework_cost06_bp04
  ]

  tags = merge(local.well_architected_framework_cost06_common_tags, {
    choice_id = "shared_resources",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_cost06_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST06-BP01'
    EOT
}

control "csv_well_architected_framework_cost06_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST06-BP02'
    EOT
}

control "csv_well_architected_framework_cost06_bp03" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST06-BP03'
    EOT
}

control "csv_well_architected_framework_cost06_bp04" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST06-BP04'
    EOT
}
