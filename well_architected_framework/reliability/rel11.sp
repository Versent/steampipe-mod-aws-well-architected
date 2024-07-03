locals {
  well_architected_framework_rel11_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "component-failure"
  })
}

benchmark "well_architected_framework_rel11" {
  title       = "REL11 How do you design your workload to withstand component failures?"
  description = "Workloads with a requirement for high availability and low mean time to recovery (MTTR) must be architected for resiliency."

  children = [
    benchmark.well_architected_framework_rel11_bp01,
    benchmark.well_architected_framework_rel11_bp02,
    benchmark.well_architected_framework_rel11_bp03,
    benchmark.well_architected_framework_rel11_bp04,
    benchmark.well_architected_framework_rel11_bp05,
    benchmark.well_architected_framework_rel11_bp06,
    benchmark.well_architected_framework_rel11_bp07
  ]

  tags = local.well_architected_framework_rel11_common_tags
}

benchmark "well_architected_framework_rel11_bp01" {
  title       = "REL11-BP01 Monitor all components of the workload to detect failures"
  description = "Monitor all components of the workload to detect failures and ensure high availability."

  children = [
    control.csv_well_architected_framework_rel11_bp01
  ]

  tags = merge(local.well_architected_framework_rel11_common_tags, {
    choice_id = "monitor_components",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel11_bp02" {
  title       = "REL11-BP02 Fail over to healthy resources"
  description = "Fail over to healthy resources to ensure continuity of operations and minimize downtime."

  children = [
    control.csv_well_architected_framework_rel11_bp02
  ]

  tags = merge(local.well_architected_framework_rel11_common_tags, {
    choice_id = "failover_resources",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel11_bp03" {
  title       = "REL11-BP03 Automate healing on all layers"
  description = "Automate healing on all layers of the workload to ensure quick recovery and reduce mean time to recovery (MTTR)."

  children = [
    control.csv_well_architected_framework_rel11_bp03
  ]

  tags = merge(local.well_architected_framework_rel11_common_tags, {
    choice_id = "automate_healing",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel11_bp04" {
  title       = "REL11-BP04 Rely on the data plane and not the control plane during recovery"
  description = "Rely on the data plane and not the control plane during recovery to ensure that recovery operations are not hindered by control plane failures."

  children = [
    control.csv_well_architected_framework_rel11_bp04
  ]

  tags = merge(local.well_architected_framework_rel11_common_tags, {
    choice_id = "data_plane_recovery",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel11_bp05" {
  title       = "REL11-BP05 Use static stability to prevent bimodal behavior"
  description = "Use static stability to prevent bimodal behavior and ensure consistent performance during failure scenarios."

  children = [
    control.csv_well_architected_framework_rel11_bp05
  ]

  tags = merge(local.well_architected_framework_rel11_common_tags, {
    choice_id = "static_stability",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel11_bp06" {
  title       = "REL11-BP06 Send notifications when events impact availability"
  description = "Send notifications when events impact availability to ensure that the appropriate teams are aware and can take action."

  children = [
    control.csv_well_architected_framework_rel11_bp06
  ]

  tags = merge(local.well_architected_framework_rel11_common_tags, {
    choice_id = "availability_notifications",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel11_bp07" {
  title       = "REL11-BP07 Architect your product to meet availability targets and uptime service level agreements (SLAs)"
  description = "Architect your product to meet availability targets and uptime service level agreements (SLAs) to ensure high availability and reliability."

  children = [
    control.csv_well_architected_framework_rel11_bp07
  ]

  tags = merge(local.well_architected_framework_rel11_common_tags, {
    choice_id = "meet_sla",
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_rel11_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL11-BP01'
    EOT
}

control "csv_well_architected_framework_rel11_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL11-BP02'
    EOT
}

control "csv_well_architected_framework_rel11_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL11-BP03'
    EOT
}

control "csv_well_architected_framework_rel11_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL11-BP04'
    EOT
}

control "csv_well_architected_framework_rel11_bp05" {
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
      pillar = 'reliability' AND best_practise = 'REL11-BP05'
    EOT
}

control "csv_well_architected_framework_rel11_bp06" {
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
      pillar = 'reliability' AND best_practise = 'REL11-BP06'
    EOT
}

control "csv_well_architected_framework_rel11_bp07" {
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
      pillar = 'reliability' AND best_practise = 'REL11-BP07'
    EOT
}