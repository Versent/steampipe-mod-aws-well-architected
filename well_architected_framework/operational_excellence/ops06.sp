locals {
  well_architected_framework_ops06_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "ops-mitigate-deployment-risks"
  })
}

benchmark "well_architected_framework_ops06" {
  title       = "OPS06 How do you mitigate deployment risks?"
  description = "Adopting approaches that provide fast feedback on quality and achieve rapid recovery from changes that do not have desired outcomes helps mitigate the impact of issues introduced through deployment."

  children = [
    benchmark.well_architected_framework_ops06_bp01,
    benchmark.well_architected_framework_ops06_bp02,
    benchmark.well_architected_framework_ops06_bp03,
    benchmark.well_architected_framework_ops06_bp04
  ]

  tags = local.well_architected_framework_ops06_common_tags
}

benchmark "well_architected_framework_ops06_bp01" {
  title       = "OPS06-BP01 Plan for unsuccessful changes"
  description = "Develop a comprehensive plan for dealing with unsuccessful changes to minimize downtime and disruption."

  children = [
    control.csv_well_architected_framework_ops06_bp01
  ]

  tags = merge(local.well_architected_framework_ops06_common_tags, {
    choice_id = "ops_plan_unsuccessful_changes"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops06_bp02" {
  title       = "OPS06-BP02 Test deployments"
  description = "Thoroughly test deployments in a controlled environment to ensure they work as expected before going live."

  children = [
    control.csv_well_architected_framework_ops06_bp02
  ]

  tags = merge(local.well_architected_framework_ops06_common_tags, {
    choice_id = "ops_test_deployments"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops06_bp03" {
  title       = "OPS06-BP03 Employ safe deployment strategies"
  description = "Use strategies such as canary releases, blue-green deployments, and feature toggles to minimize risk."

  children = [
    control.csv_well_architected_framework_ops06_bp03
  ]

  tags = merge(local.well_architected_framework_ops06_common_tags, {
    choice_id = "ops_safe_deployment_strategies"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops06_bp04" {
  title       = "OPS06-BP04 Automate testing and rollback"
  description = "Automate testing and rollback processes to quickly and reliably handle any issues that arise during deployment."

  children = [
    control.csv_well_architected_framework_ops06_bp04
  ]

  tags = merge(local.well_architected_framework_ops06_common_tags, {
    choice_id = "ops_automate_testing_rollback"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_ops06_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS06-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops06_common_tags, {
    choice_id = "ops_plan_unsuccessful_changes"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops06_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS06-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops06_common_tags, {
    choice_id = "ops_test_deployments"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops06_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS06-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops06_common_tags, {
    choice_id = "ops_safe_deployment_strategies"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops06_bp04" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS06-BP04'
    EOT

  tags = merge(local.well_architected_framework_ops06_common_tags, {
    choice_id = "ops_automate_testing_rollback"
    risk      = "High"
  })
}