locals {
  well_architected_framework_sus03_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "sustainability-patterns"
  })
}

benchmark "well_architected_framework_sus03" {
  title       = "SUS3 How do you take advantage of software and architecture patterns to support your sustainability goals?"
  description = "Implement patterns for performing load smoothing and maintaining consistent high utilization of deployed resources to minimize the resources consumed. Components might become idle from lack of use because of changes in user behavior over time. Revise patterns and architecture to consolidate under-utilized components to increase overall utilization. Retire components that are no longer required. Understand the performance of your workload components, and optimize the components that consume the most resources. Be aware of the devices that your customers use to access your services, and implement patterns to minimize the need for device upgrades."

  children = [
    benchmark.well_architected_framework_sus03_bp01,
    benchmark.well_architected_framework_sus03_bp02,
    benchmark.well_architected_framework_sus03_bp03,
    benchmark.well_architected_framework_sus03_bp04,
    benchmark.well_architected_framework_sus03_bp05
  ]

  tags = local.well_architected_framework_sus03_common_tags
}

benchmark "well_architected_framework_sus03_bp01" {
  title       = "SUS03-BP01 Optimize software and architecture for asynchronous and scheduled jobs"
  description = "Optimize software and architecture for asynchronous and scheduled jobs to improve resource utilization and efficiency."

  children = [
    control.csv_well_architected_framework_sus03_bp01
  ]

  tags = merge(local.well_architected_framework_sus03_common_tags, {
    choice_id = "optimize_async_jobs",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus03_bp02" {
  title       = "SUS03-BP02 Remove or refactor workload components with low or no use"
  description = "Remove or refactor workload components with low or no use to minimize waste and improve overall utilization."

  children = [
    control.csv_well_architected_framework_sus03_bp02
  ]

  tags = merge(local.well_architected_framework_sus03_common_tags, {
    choice_id = "remove_low_use_components",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus03_bp03" {
  title       = "SUS03-BP03 Optimize areas of code that consume the most time or resources"
  description = "Optimize areas of code that consume the most time or resources to improve efficiency and reduce resource consumption."

  children = [
    control.csv_well_architected_framework_sus03_bp03
  ]

  tags = merge(local.well_architected_framework_sus03_common_tags, {
    choice_id = "optimize_code",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus03_bp04" {
  title       = "SUS03-BP04 Optimize impact on devices and equipment"
  description = "Optimize impact on devices and equipment to minimize the need for device upgrades and reduce environmental impact."

  children = [
    control.csv_well_architected_framework_sus03_bp04
  ]

  tags = merge(local.well_architected_framework_sus03_common_tags, {
    choice_id = "optimize_device_impact",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus03_bp05" {
  title       = "SUS03-BP05 Use software patterns and architectures that best support data access and storage patterns"
  description = "Use software patterns and architectures that best support data access and storage patterns to improve efficiency and reduce resource consumption."

  children = [
    control.csv_well_architected_framework_sus03_bp05
  ]

  tags = merge(local.well_architected_framework_sus03_common_tags, {
    choice_id = "optimize_data_patterns",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_sus03_bp01" {
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
      pillar = 'sustainability' AND best_practise = 'SUS03-BP01'
    EOT
}

control "csv_well_architected_framework_sus03_bp02" {
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
      pillar = 'sustainability' AND best_practise = 'SUS03-BP02'
    EOT
}

control "csv_well_architected_framework_sus03_bp03" {
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
      pillar = 'sustainability' AND best_practise = 'SUS03-BP03'
    EOT
}

control "csv_well_architected_framework_sus03_bp04" {
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
      pillar = 'sustainability' AND best_practise = 'SUS03-BP04'
    EOT
}

control "csv_well_architected_framework_sus03_bp05" {
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
      pillar = 'sustainability' AND best_practise = 'SUS03-BP05'
    EOT
}
