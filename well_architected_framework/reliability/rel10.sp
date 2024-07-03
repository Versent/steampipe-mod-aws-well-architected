locals {
  well_architected_framework_rel10_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "fault-isolation"
  })
}

benchmark "well_architected_framework_rel10" {
  title       = "REL10 How do you use fault isolation to protect your workload?"
  description = "Fault isolated boundaries limit the effect of a failure within a workload to a limited number of components. Components outside of the boundary are unaffected by the failure. Using multiple fault isolated boundaries, you can limit the impact on your workload."

  children = [
    benchmark.well_architected_framework_rel10_bp01,
    benchmark.well_architected_framework_rel10_bp02,
    benchmark.well_architected_framework_rel10_bp03,
    benchmark.well_architected_framework_rel10_bp04
  ]

  tags = local.well_architected_framework_rel10_common_tags
}

benchmark "well_architected_framework_rel10_bp01" {
  title       = "REL10-BP01 Deploy the workload to multiple locations"
  description = "Deploy the workload to multiple locations to ensure that a failure in one location does not affect the entire workload."

  children = [
    control.csv_well_architected_framework_rel10_bp01
  ]

  tags = merge(local.well_architected_framework_rel10_common_tags, {
    choice_id = "multiple_locations",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel10_bp02" {
  title       = "REL10-BP02 Select the appropriate locations for your multi-location deployment"
  description = "Select the appropriate locations for your multi-location deployment to ensure optimal performance and reliability."

  children = [
    control.csv_well_architected_framework_rel10_bp02
  ]

  tags = merge(local.well_architected_framework_rel10_common_tags, {
    choice_id = "appropriate_locations",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel10_bp03" {
  title       = "REL10-BP03 Automate recovery for components constrained to a single location"
  description = "Automate recovery for components constrained to a single location to ensure quick recovery in case of a failure."

  children = [
    control.csv_well_architected_framework_rel10_bp03
  ]

  tags = merge(local.well_architected_framework_rel10_common_tags, {
    choice_id = "automate_recovery",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel10_bp04" {
  title       = "REL10-BP04 Use bulkhead architectures to limit scope of impact"
  description = "Use bulkhead architectures to limit the scope of impact and prevent a failure in one component from affecting others."

  children = [
    control.csv_well_architected_framework_rel10_bp04
  ]

  tags = merge(local.well_architected_framework_rel10_common_tags, {
    choice_id = "bulkhead_architectures",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_rel10_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL10-BP01'
    EOT
}

control "csv_well_architected_framework_rel10_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL10-BP02'
    EOT
}

control "csv_well_architected_framework_rel10_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL10-BP03'
    EOT
}

control "csv_well_architected_framework_rel10_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL10-BP04'
    EOT
}