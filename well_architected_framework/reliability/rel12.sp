locals {
  well_architected_framework_rel12_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "reliability-testing"
  })
}

benchmark "well_architected_framework_rel12" {
  title       = "REL12 How do you test reliability?"
  description = "After you have designed your workload to be resilient to the stresses of production, testing is the only way to verify that it will operate as designed, and deliver the resiliency you expect."

  children = [
    benchmark.well_architected_framework_rel12_bp01,
    benchmark.well_architected_framework_rel12_bp02,
    benchmark.well_architected_framework_rel12_bp03,
    benchmark.well_architected_framework_rel12_bp04,
    benchmark.well_architected_framework_rel12_bp05,
    benchmark.well_architected_framework_rel12_bp06
  ]

  tags = local.well_architected_framework_rel12_common_tags
}

benchmark "well_architected_framework_rel12_bp01" {
  title       = "REL12-BP01 Use playbooks to investigate failures"
  description = "Use playbooks to investigate failures to ensure that you have a consistent and repeatable process for identifying and addressing issues."

  children = [
    control.csv_well_architected_framework_rel12_bp01
  ]

  tags = merge(local.well_architected_framework_rel12_common_tags, {
    choice_id = "use_playbooks",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel12_bp02" {
  title       = "REL12-BP02 Perform post-incident analysis"
  description = "Perform post-incident analysis to understand the root causes of failures and to identify opportunities for improvement."

  children = [
    control.csv_well_architected_framework_rel12_bp02
  ]

  tags = merge(local.well_architected_framework_rel12_common_tags, {
    choice_id = "post_incident_analysis",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel12_bp03" {
  title       = "REL12-BP03 Test functional requirements"
  description = "Test functional requirements to ensure that your workload behaves as expected under normal and failure conditions."

  children = [
    control.csv_well_architected_framework_rel12_bp03
  ]

  tags = merge(local.well_architected_framework_rel12_common_tags, {
    choice_id = "functional_testing",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel12_bp04" {
  title       = "REL12-BP04 Test scaling and performance requirements"
  description = "Test scaling and performance requirements to ensure that your workload can handle expected and unexpected increases in demand."

  children = [
    control.csv_well_architected_framework_rel12_bp04
  ]

  tags = merge(local.well_architected_framework_rel12_common_tags, {
    choice_id = "scaling_performance_testing",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel12_bp05" {
  title       = "REL12-BP05 Test resiliency using chaos engineering"
  description = "Test resiliency using chaos engineering to ensure that your workload can withstand and recover from unexpected failures."

  children = [
    control.csv_well_architected_framework_rel12_bp05
  ]

  tags = merge(local.well_architected_framework_rel12_common_tags, {
    choice_id = "chaos_engineering",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel12_bp06" {
  title       = "REL12-BP06 Conduct game days regularly"
  description = "Conduct game days regularly to simulate failure scenarios and to test your response processes and procedures."

  children = [
    control.csv_well_architected_framework_rel12_bp06
  ]

  tags = merge(local.well_architected_framework_rel12_common_tags, {
    choice_id = "game_days",
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_rel12_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL12-BP01'
    EOT
}

control "csv_well_architected_framework_rel12_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL12-BP02'
    EOT
}

control "csv_well_architected_framework_rel12_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL12-BP03'
    EOT
}

control "csv_well_architected_framework_rel12_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL12-BP04'
    EOT
}

control "csv_well_architected_framework_rel12_bp05" {
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
      pillar = 'reliability' AND best_practise = 'REL12-BP05'
    EOT
}

control "csv_well_architected_framework_rel12_bp06" {
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
      pillar = 'reliability' AND best_practise = 'REL12-BP06'
    EOT
}