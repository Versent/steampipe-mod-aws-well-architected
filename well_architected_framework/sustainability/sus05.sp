locals {
  well_architected_framework_sus05_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "hardware-services-sustainability"
  })
}

benchmark "well_architected_framework_sus05" {
  title       = "SUS5 How do you select and use cloud hardware and services in your architecture to support your sustainability goals?"
  description = "Look for opportunities to reduce workload sustainability impacts by making changes to your hardware management practices. Minimize the amount of hardware needed to provision and deploy, and select the most efficient hardware and services for your individual workload."

  children = [
    benchmark.well_architected_framework_sus05_bp01,
    benchmark.well_architected_framework_sus05_bp02,
    benchmark.well_architected_framework_sus05_bp03,
    benchmark.well_architected_framework_sus05_bp04
  ]

  tags = local.well_architected_framework_sus05_common_tags
}

benchmark "well_architected_framework_sus05_bp01" {
  title       = "SUS05-BP01 Use the minimum amount of hardware to meet your needs"
  description = "Use the minimum amount of hardware to meet your needs to reduce the environmental impact of your workload."

  children = [
    control.csv_well_architected_framework_sus05_bp01
  ]

  tags = merge(local.well_architected_framework_sus05_common_tags, {
    choice_id = "minimum_hardware",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus05_bp02" {
  title       = "SUS05-BP02 Use instance types with the least impact"
  description = "Use instance types with the least impact to optimize resource efficiency and minimize environmental impact."

  children = [
    control.csv_well_architected_framework_sus05_bp02
  ]

  tags = merge(local.well_architected_framework_sus05_common_tags, {
    choice_id = "least_impact_instance_types",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus05_bp03" {
  title       = "SUS05-BP03 Use managed services"
  description = "Use managed services to leverage AWS's infrastructure efficiency and reduce your sustainability impact."

  children = [
    control.csv_well_architected_framework_sus05_bp03
  ]

  tags = merge(local.well_architected_framework_sus05_common_tags, {
    choice_id = "use_managed_services",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus05_bp04" {
  title       = "SUS05-BP04 Optimize your use of hardware-based compute accelerators"
  description = "Optimize your use of hardware-based compute accelerators to improve performance and reduce energy consumption."

  children = [
    control.csv_well_architected_framework_sus05_bp04
  ]

  tags = merge(local.well_architected_framework_sus05_common_tags, {
    choice_id = "optimize_compute_accelerators",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_sus05_bp01" {
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
      pillar = 'sustainability' AND best_practise = 'SUS05-BP01'
    EOT
}

control "csv_well_architected_framework_sus05_bp02" {
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
      pillar = 'sustainability' AND best_practise = 'SUS05-BP02'
    EOT
}

control "csv_well_architected_framework_sus05_bp03" {
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
      pillar = 'sustainability' AND best_practise = 'SUS05-BP03'
    EOT
}

control "csv_well_architected_framework_sus05_bp04" {
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
      pillar = 'sustainability' AND best_practise = 'SUS05-BP04'
    EOT
}
