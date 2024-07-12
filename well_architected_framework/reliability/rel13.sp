locals {
  well_architected_framework_rel13_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "disaster-recovery"
  })
}

benchmark "well_architected_framework_rel13" {
  title       = "REL13 How do you plan for disaster recovery (DR)?"
  description = "Having backups and redundant workload components in place is the start of your DR strategy. RTO and RPO are your objectives for restoration of your workload. Set these based on business needs. Implement a strategy to meet these objectives, considering locations and function of workload resources and data. The probability of disruption and cost of recovery are also key factors that help to inform the business value of providing disaster recovery for a workload."

  children = [
    benchmark.well_architected_framework_rel13_bp01,
    benchmark.well_architected_framework_rel13_bp02,
    benchmark.well_architected_framework_rel13_bp03,
    benchmark.well_architected_framework_rel13_bp04,
    benchmark.well_architected_framework_rel13_bp05
  ]

  tags = local.well_architected_framework_rel13_common_tags
}

benchmark "well_architected_framework_rel13_bp01" {
  title       = "REL13-BP01 Define recovery objectives for downtime and data loss"
  description = "Define recovery objectives for downtime and data loss (RTO and RPO) based on business needs to ensure that your disaster recovery strategy meets your recovery objectives."

  children = [
    control.csv_well_architected_framework_rel13_bp01
  ]

  tags = merge(local.well_architected_framework_rel13_common_tags, {
    choice_id = "define_recovery_objectives",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel13_bp02" {
  title       = "REL13-BP02 Use defined recovery strategies to meet the recovery objectives"
  description = "Use defined recovery strategies to meet the recovery objectives and ensure that your workload can be restored within the required timeframes."

  children = [
    control.csv_well_architected_framework_rel13_bp02
  ]

  tags = merge(local.well_architected_framework_rel13_common_tags, {
    choice_id = "recovery_strategies",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel13_bp03" {
  title       = "REL13-BP03 Test disaster recovery implementation to validate the implementation"
  description = "Test disaster recovery implementation regularly to validate that it meets your recovery objectives and to identify any areas for improvement."

  children = [
    control.csv_well_architected_framework_rel13_bp03
  ]

  tags = merge(local.well_architected_framework_rel13_common_tags, {
    choice_id = "test_dr_implementation",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel13_bp04" {
  title       = "REL13-BP04 Manage configuration drift at the DR site or Region"
  description = "Manage configuration drift at the DR site or Region to ensure that your disaster recovery implementation remains consistent with your primary environment."

  children = [
    control.csv_well_architected_framework_rel13_bp04
  ]

  tags = merge(local.well_architected_framework_rel13_common_tags, {
    choice_id = "manage_config_drift",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel13_bp05" {
  title       = "REL13-BP05 Automate recovery"
  description = "Automate recovery to ensure quick and reliable restoration of your workload in the event of a disaster."

  children = [
    control.csv_well_architected_framework_rel13_bp05
  ]

  tags = merge(local.well_architected_framework_rel13_common_tags, {
    choice_id = "automate_recovery",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_rel13_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL13-BP01'
    EOT
}

control "csv_well_architected_framework_rel13_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL13-BP02'
    EOT
}

control "csv_well_architected_framework_rel13_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL13-BP03'
    EOT
}

control "csv_well_architected_framework_rel13_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL13-BP04'
    EOT
}

control "csv_well_architected_framework_rel13_bp05" {
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
      pillar = 'reliability' AND best_practise = 'REL13-BP05'
    EOT
}