locals {
  well_architected_framework_rel08_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "change-implementation"
  })
}

benchmark "well_architected_framework_rel08" {
  title       = "REL8 How do you implement change?"
  description = "Controlled changes are necessary to deploy new functionality, and to verify that the workloads and the operating environment are running known software and can be patched or replaced in a predictable manner. If these changes are uncontrolled, then it makes it difficult to predict the effect of these changes, or to address issues that arise because of them."

  children = [
    benchmark.well_architected_framework_rel08_bp01,
    benchmark.well_architected_framework_rel08_bp02,
    benchmark.well_architected_framework_rel08_bp03,
    benchmark.well_architected_framework_rel08_bp04,
    benchmark.well_architected_framework_rel08_bp05
  ]

  tags = local.well_architected_framework_rel08_common_tags
}

benchmark "well_architected_framework_rel08_bp01" {
  title       = "REL08-BP01 Use runbooks for standard activities such as deployment"
  description = "Use runbooks for standard activities such as deployment to ensure that these activities are performed consistently and reliably."

  children = [
    control.csv_well_architected_framework_rel08_bp01
  ]

  tags = merge(local.well_architected_framework_rel08_common_tags, {
    choice_id = "use_runbooks",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel08_bp02" {
  title       = "REL08-BP02 Integrate functional testing as part of your deployment"
  description = "Integrate functional testing as part of your deployment process to ensure that new functionality works as expected and does not introduce regressions."

  children = [
    control.csv_well_architected_framework_rel08_bp02
  ]

  tags = merge(local.well_architected_framework_rel08_common_tags, {
    choice_id = "functional_testing",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel08_bp03" {
  title       = "REL08-BP03 Integrate resiliency testing as part of your deployment"
  description = "Integrate resiliency testing as part of your deployment process to ensure that your workload can withstand and recover from failures."

  children = [
    control.csv_well_architected_framework_rel08_bp03
  ]

  tags = merge(local.well_architected_framework_rel08_common_tags, {
    choice_id = "resiliency_testing",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel08_bp04" {
  title       = "REL08-BP04 Deploy using immutable infrastructure"
  description = "Deploy using immutable infrastructure to ensure that your deployments are consistent and reproducible, reducing the risk of configuration drift."

  children = [
    control.csv_well_architected_framework_rel08_bp04
  ]

  tags = merge(local.well_architected_framework_rel08_common_tags, {
    choice_id = "immutable_infrastructure",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel08_bp05" {
  title       = "REL08-BP05 Deploy changes with automation"
  description = "Deploy changes with automation to ensure that deployments are consistent, repeatable, and can be performed with minimal human intervention."

  children = [
    control.csv_well_architected_framework_rel08_bp05
  ]

  tags = merge(local.well_architected_framework_rel08_common_tags, {
    choice_id = "automation_deployment",
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_rel08_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL08-BP01'
    EOT
}

control "csv_well_architected_framework_rel08_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL08-BP02'
    EOT
}

control "csv_well_architected_framework_rel08_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL08-BP03'
    EOT
}

control "csv_well_architected_framework_rel08_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL08-BP04'
    EOT
}

control "csv_well_architected_framework_rel08_bp05" {
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
      pillar = 'reliability' AND best_practise = 'REL08-BP05'
    EOT
}

#benchmark "well_architected_framework_rel08_bp05" {
#
#    aws_compliance.control.rds_db_instance_automatic_minor_version_upgrade_enabled
