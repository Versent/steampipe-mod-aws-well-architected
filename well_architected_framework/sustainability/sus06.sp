locals {
  well_architected_framework_sus06_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "organizational-processes-sustainability"
  })
}

benchmark "well_architected_framework_sus06" {
  title       = "SUS6 How do your organizational processes support your sustainability goals?"
  description = "Look for opportunities to reduce your sustainability impact by making changes to your development, test, and deployment practices."

  children = [
    benchmark.well_architected_framework_sus06_bp01,
    benchmark.well_architected_framework_sus06_bp02,
    benchmark.well_architected_framework_sus06_bp03,
    benchmark.well_architected_framework_sus06_bp04
  ]

  tags = local.well_architected_framework_sus06_common_tags
}

benchmark "well_architected_framework_sus06_bp01" {
  title       = "SUS06-BP01 Adopt methods that can rapidly introduce sustainability improvements"
  description = "Adopt methods that can rapidly introduce sustainability improvements to ensure continuous enhancement of your sustainability goals."

  children = [
    control.csv_well_architected_framework_sus06_bp01
  ]

  tags = merge(local.well_architected_framework_sus06_common_tags, {
    choice_id = "rapid_sustainability_improvements",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sus06_bp02" {
  title       = "SUS06-BP02 Keep your workload up-to-date"
  description = "Keep your workload up-to-date to take advantage of the latest sustainability improvements and efficiencies."

  children = [
    control.csv_well_architected_framework_sus06_bp02
  ]

  tags = merge(local.well_architected_framework_sus06_common_tags, {
    choice_id = "up_to_date_workload",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_sus06_bp03" {
  title       = "SUS06-BP03 Increase utilization of build environments"
  description = "Increase utilization of build environments to ensure resources are used efficiently and sustainably."

  children = [
    control.csv_well_architected_framework_sus06_bp03
  ]

  tags = merge(local.well_architected_framework_sus06_common_tags, {
    choice_id = "utilize_build_environments",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_sus06_bp04" {
  title       = "SUS06-BP04 Use managed device farms for testing"
  description = "Use managed device farms for testing to leverage shared resources and reduce the need for individual devices."

  children = [
    control.csv_well_architected_framework_sus06_bp04
  ]

  tags = merge(local.well_architected_framework_sus06_common_tags, {
    choice_id = "managed_device_farms",
    risk      = "Low"
  })
}

# Controls
control "csv_well_architected_framework_sus06_bp01" {
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
      pillar = 'sustainability' AND best_practise = 'SUS06-BP01'
    EOT
}

control "csv_well_architected_framework_sus06_bp02" {
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
      pillar = 'sustainability' AND best_practise = 'SUS06-BP02'
    EOT
}

control "csv_well_architected_framework_sus06_bp03" {
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
      pillar = 'sustainability' AND best_practise = 'SUS06-BP03'
    EOT
}

control "csv_well_architected_framework_sus06_bp04" {
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
      pillar = 'sustainability' AND best_practise = 'SUS06-BP04'
    EOT
}
