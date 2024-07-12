locals {
  well_architected_framework_rel07_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "workload-scaling"
  })
}

benchmark "well_architected_framework_rel07" {
  title       = "REL7 How do you design your workload to adapt to changes in demand?"
  description = "A scalable workload provides elasticity to add or remove resources automatically so that they closely match the current demand at any given point in time."

  children = [
    benchmark.well_architected_framework_rel07_bp01,
    benchmark.well_architected_framework_rel07_bp02,
    benchmark.well_architected_framework_rel07_bp03,
    benchmark.well_architected_framework_rel07_bp04
  ]

  tags = local.well_architected_framework_rel07_common_tags
}

benchmark "well_architected_framework_rel07_bp01" {
  title       = "REL07-BP01 Use automation when obtaining or scaling resources"
  description = "Use automation when obtaining or scaling resources to ensure that your workload can adapt quickly and efficiently to changes in demand."

  children = [
    control.csv_well_architected_framework_rel07_bp01
  ]

  tags = merge(local.well_architected_framework_rel07_common_tags, {
    choice_id = "automation_scaling",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel07_bp02" {
  title       = "REL07-BP02 Obtain resources upon detection of impairment to a workload"
  description = "Obtain additional resources upon detection of impairment to a workload to ensure that it can continue to operate effectively."

  children = [
    control.csv_well_architected_framework_rel07_bp02
  ]

  tags = merge(local.well_architected_framework_rel07_common_tags, {
    choice_id = "obtain_resources_impairment",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel07_bp03" {
  title       = "REL07-BP03 Obtain resources upon detection that more resources are needed for a workload"
  description = "Obtain additional resources upon detection that more resources are needed for a workload to ensure that it can handle increased demand."

  children = [
    control.csv_well_architected_framework_rel07_bp03
  ]

  tags = merge(local.well_architected_framework_rel07_common_tags, {
    choice_id = "obtain_resources_needed",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel07_bp04" {
  title       = "REL07-BP04 Load test your workload"
  description = "Load test your workload to ensure that it can handle changes in demand and to identify any potential bottlenecks or limitations."

  children = [
    control.csv_well_architected_framework_rel07_bp04
  ]

  tags = merge(local.well_architected_framework_rel07_common_tags, {
    choice_id = "load_testing",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_rel07_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL07-BP01'
    EOT
}

control "csv_well_architected_framework_rel07_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL07-BP02'
    EOT
}

control "csv_well_architected_framework_rel07_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL07-BP03'
    EOT
}

control "csv_well_architected_framework_rel07_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL07-BP04'
    EOT
}

#benchmark "well_architected_framework_rel07_bp01" {
#    aws_compliance.control.autoscaling_group_multiple_az_configured,
#    aws_compliance.control.dynamodb_table_auto_scaling_enabled
