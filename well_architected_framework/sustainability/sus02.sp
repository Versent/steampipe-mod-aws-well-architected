locals {
  well_architected_framework_sus02_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "align-resources"
  })
}

benchmark "well_architected_framework_sus02" {
  title       = "SUS2 How do you align cloud resources to your demand?"
  description = "The way users and applications consume your workloads and other resources can help you identify improvements to meet sustainability goals. Scale infrastructure to continually match demand and verify that you use only the minimum resources required to support your users. Align service levels to customer needs. Position resources to limit the network required for users and applications to consume them. Remove unused assets. Provide your team members with devices that support their needs and minimize their sustainability impact."

  children = [
    benchmark.well_architected_framework_sus02_bp01,
    benchmark.well_architected_framework_sus02_bp02,
    benchmark.well_architected_framework_sus02_bp03,
    benchmark.well_architected_framework_sus02_bp04,
    benchmark.well_architected_framework_sus02_bp05,
    benchmark.well_architected_framework_sus02_bp06
  ]

  tags = local.well_architected_framework_sus02_common_tags
}

benchmark "well_architected_framework_sus02_bp01" {
  title       = "SUS02-BP01 Scale workload infrastructure dynamically"
  description = "Scale workload infrastructure dynamically to match demand and use only the minimum resources required."

  children = [
    control.csv_well_architected_framework_sus02_bp01
  ]

  tags = merge(local.well_architected_framework_sus02_common_tags, {
    choice_id = "dynamic_scaling",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus02_bp02" {
  title       = "SUS02-BP02 Align SLAs with sustainability goals"
  description = "Align SLAs with sustainability goals to ensure that service levels are in line with sustainability objectives."

  children = [
    control.csv_well_architected_framework_sus02_bp02
  ]

  tags = merge(local.well_architected_framework_sus02_common_tags, {
    choice_id = "align_slas",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_sus02_bp03" {
  title       = "SUS02-BP03 Stop the creation and maintenance of unused assets"
  description = "Stop the creation and maintenance of unused assets to minimize waste and improve sustainability."

  children = [
    control.csv_well_architected_framework_sus02_bp03
  ]

  tags = merge(local.well_architected_framework_sus02_common_tags, {
    choice_id = "stop_unused_assets",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_sus02_bp04" {
  title       = "SUS02-BP04 Optimize geographic placement of workloads based on their networking requirements"
  description = "Optimize geographic placement of workloads based on their networking requirements to limit the network required for users and applications to consume them."

  children = [
    control.csv_well_architected_framework_sus02_bp04
  ]

  tags = merge(local.well_architected_framework_sus02_common_tags, {
    choice_id = "optimize_placement",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus02_bp05" {
  title       = "SUS02-BP05 Optimize team member resources for activities performed"
  description = "Optimize team member resources for activities performed to ensure they support their needs and minimize their sustainability impact."

  children = [
    control.csv_well_architected_framework_sus02_bp05
  ]

  tags = merge(local.well_architected_framework_sus02_common_tags, {
    choice_id = "optimize_team_resources",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_sus02_bp06" {
  title       = "SUS02-BP06 Implement buffering or throttling to flatten the demand curve"
  description = "Implement buffering or throttling to flatten the demand curve and optimize resource utilization."

  children = [
    control.csv_well_architected_framework_sus02_bp06
  ]

  tags = merge(local.well_architected_framework_sus02_common_tags, {
    choice_id = "buffer_throttle",
    risk      = "Low"
  })
}

# Controls
control "csv_well_architected_framework_sus02_bp01" {
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
      pillar = 'sustainability' AND best_practise = 'SUS02-BP01'
    EOT
}

control "csv_well_architected_framework_sus02_bp02" {
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
      pillar = 'sustainability' AND best_practise = 'SUS02-BP02'
    EOT
}

control "csv_well_architected_framework_sus02_bp03" {
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
      pillar = 'sustainability' AND best_practise = 'SUS02-BP03'
    EOT
}

control "csv_well_architected_framework_sus02_bp04" {
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
      pillar = 'sustainability' AND best_practise = 'SUS02-BP04'
    EOT
}

control "csv_well_architected_framework_sus02_bp05" {
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
      pillar = 'sustainability' AND best_practise = 'SUS02-BP05'
    EOT
}

control "csv_well_architected_framework_sus02_bp06" {
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
      pillar = 'sustainability' AND best_practise = 'SUS02-BP06'
    EOT
}
