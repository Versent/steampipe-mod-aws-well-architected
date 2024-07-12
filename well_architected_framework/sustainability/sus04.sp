locals {
  well_architected_framework_sus04_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "data-management-policies"
  })
}

benchmark "well_architected_framework_sus04" {
  title       = "SUS4 How do you take advantage of data management policies and patterns to support your sustainability goals?"
  description = "Implement data management practices to reduce the provisioned storage required to support your workload, and the resources required to use it. Understand your data, and use storage technologies and configurations that more effectively support the business value of the data and how it’s used. Lifecycle data to more efficient, less performant storage when requirements decrease, and delete data that’s no longer required."

  children = [
    benchmark.well_architected_framework_sus04_bp01,
    benchmark.well_architected_framework_sus04_bp02,
    benchmark.well_architected_framework_sus04_bp03,
    benchmark.well_architected_framework_sus04_bp04,
    benchmark.well_architected_framework_sus04_bp05,
    benchmark.well_architected_framework_sus04_bp06,
    benchmark.well_architected_framework_sus04_bp07,
    benchmark.well_architected_framework_sus04_bp08
  ]

  tags = local.well_architected_framework_sus04_common_tags
}

benchmark "well_architected_framework_sus04_bp01" {
  title       = "SUS04-BP01 Implement a data classification policy"
  description = "Implement a data classification policy to ensure data is stored and managed appropriately based on its business value and usage."

  children = [
    control.csv_well_architected_framework_sus04_bp01
  ]

  tags = merge(local.well_architected_framework_sus04_common_tags, {
    choice_id = "data_classification_policy",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus04_bp02" {
  title       = "SUS04-BP02 Use technologies that support data access and storage patterns"
  description = "Use technologies that support data access and storage patterns to optimize data management and resource utilization."

  children = [
    control.csv_well_architected_framework_sus04_bp02
  ]

  tags = merge(local.well_architected_framework_sus04_common_tags, {
    choice_id = "data_access_storage_technologies",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_sus04_bp03" {
  title       = "SUS04-BP03 Use policies to manage the lifecycle of your datasets"
  description = "Use policies to manage the lifecycle of your datasets to ensure data is moved to more efficient storage or deleted when no longer required."

  children = [
    control.csv_well_architected_framework_sus04_bp03
  ]

  tags = merge(local.well_architected_framework_sus04_common_tags, {
    choice_id = "data_lifecycle_management",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus04_bp04" {
  title       = "SUS04-BP04 Use elasticity and automation to expand block storage or file system"
  description = "Use elasticity and automation to expand block storage or file system dynamically as needed."

  children = [
    control.csv_well_architected_framework_sus04_bp04
  ]

  tags = merge(local.well_architected_framework_sus04_common_tags, {
    choice_id = "elasticity_automation_storage",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus04_bp05" {
  title       = "SUS04-BP05 Remove unneeded or redundant data"
  description = "Remove unneeded or redundant data to optimize storage usage and reduce waste."

  children = [
    control.csv_well_architected_framework_sus04_bp05
  ]

  tags = merge(local.well_architected_framework_sus04_common_tags, {
    choice_id = "remove_redundant_data",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus04_bp06" {
  title       = "SUS04-BP06 Use shared file systems or storage to access common data"
  description = "Use shared file systems or storage to access common data and improve efficiency."

  children = [
    control.csv_well_architected_framework_sus04_bp06
  ]

  tags = merge(local.well_architected_framework_sus04_common_tags, {
    choice_id = "shared_file_systems",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus04_bp07" {
  title       = "SUS04-BP07 Minimize data movement across networks"
  description = "Minimize data movement across networks to reduce network usage and associated costs."

  children = [
    control.csv_well_architected_framework_sus04_bp07
  ]

  tags = merge(local.well_architected_framework_sus04_common_tags, {
    choice_id = "minimize_data_movement",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus04_bp08" {
  title       = "SUS04-BP08 Back up data only when difficult to recreate"
  description = "Back up data only when difficult to recreate to optimize storage usage and reduce unnecessary backups."

  children = [
    control.csv_well_architected_framework_sus04_bp08
  ]

  tags = merge(local.well_architected_framework_sus04_common_tags, {
    choice_id = "optimize_backups",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_sus04_bp01" {
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
      pillar = 'sustainability' AND best_practise = 'SUS04-BP01'
    EOT
}

control "csv_well_architected_framework_sus04_bp02" {
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
      pillar = 'sustainability' AND best_practise = 'SUS04-BP02'
    EOT
}

control "csv_well_architected_framework_sus04_bp03" {
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
      pillar = 'sustainability' AND best_practise = 'SUS04-BP03'
    EOT
}

control "csv_well_architected_framework_sus04_bp04" {
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
      pillar = 'sustainability' AND best_practise = 'SUS04-BP04'
    EOT
}

control "csv_well_architected_framework_sus04_bp05" {
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
      pillar = 'sustainability' AND best_practise = 'SUS04-BP05'
    EOT
}

control "csv_well_architected_framework_sus04_bp06" {
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
      pillar = 'sustainability' AND best_practise = 'SUS04-BP06'
    EOT
}

control "csv_well_architected_framework_sus04_bp07" {
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
      pillar = 'sustainability' AND best_practise = 'SUS04-BP07'
    EOT
}

control "csv_well_architected_framework_sus04_bp08" {
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
      pillar = 'sustainability' AND best_practise = 'SUS04-BP08'
    EOT
}
