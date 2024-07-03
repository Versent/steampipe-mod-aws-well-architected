locals {
  well_architected_framework_ops10_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "ops-manage-events"
  })
}

benchmark "well_architected_framework_ops10" {
  title       = "OPS10 How do you manage workload and operations events?"
  description = "Prepare and validate procedures for responding to events to minimize their disruption to your workload."

  children = [
    benchmark.well_architected_framework_ops10_bp01,
    benchmark.well_architected_framework_ops10_bp02,
    benchmark.well_architected_framework_ops10_bp03,
    benchmark.well_architected_framework_ops10_bp04,
    benchmark.well_architected_framework_ops10_bp05,
    benchmark.well_architected_framework_ops10_bp06,
    benchmark.well_architected_framework_ops10_bp07
  ]

  tags = local.well_architected_framework_ops10_common_tags
}

benchmark "well_architected_framework_ops10_bp01" {
  title       = "OPS10-BP01 Use a process for event, incident, and problem management"
  description = "Implement a structured process for managing events, incidents, and problems to ensure efficient and effective resolution."

  children = [
    control.csv_well_architected_framework_ops10_bp01
  ]

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_event_incident_management"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops10_bp02" {
  title       = "OPS10-BP02 Have a process per alert"
  description = "Develop a specific process for each type of alert to ensure timely and appropriate responses."

  children = [
    control.csv_well_architected_framework_ops10_bp02
  ]

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_process_per_alert"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops10_bp03" {
  title       = "OPS10-BP03 Prioritize operational events based on business impact"
  description = "Prioritize events based on their potential impact on business operations to focus resources where they are needed most."

  children = [
    control.csv_well_architected_framework_ops10_bp03
  ]

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_prioritize_events"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops10_bp04" {
  title       = "OPS10-BP04 Define escalation paths"
  description = "Establish clear escalation paths to ensure that issues are quickly addressed by the appropriate level of support."

  children = [
    control.csv_well_architected_framework_ops10_bp04
  ]

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_escalation_paths"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops10_bp05" {
  title       = "OPS10-BP05 Define a customer communication plan for service-impacting events"
  description = "Develop a communication plan to inform customers of service-impacting events and keep them updated on resolution progress."

  children = [
    control.csv_well_architected_framework_ops10_bp05
  ]

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_customer_communication_plan"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops10_bp06" {
  title       = "OPS10-BP06 Communicate status through dashboards"
  description = "Use dashboards to provide real-time visibility into the status of operations and events for stakeholders."

  children = [
    control.csv_well_architected_framework_ops10_bp06
  ]

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_communicate_status_dashboards"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops10_bp07" {
  title       = "OPS10-BP07 Automate responses to events"
  description = "Automate responses to common and predictable events to reduce response times and minimize human error."

  children = [
    control.csv_well_architected_framework_ops10_bp07
  ]

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_automate_responses"
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_ops10_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS10-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_event_incident_management"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops10_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS10-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_process_per_alert"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops10_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS10-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_prioritize_events"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops10_bp04" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS10-BP04'
    EOT

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_escalation_paths"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops10_bp05" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS10-BP05'
    EOT

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_customer_communication_plan"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops10_bp06" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS10-BP06'
    EOT

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_communicate_status_dashboards"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops10_bp07" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS10-BP07'
    EOT

  tags = merge(local.well_architected_framework_ops10_common_tags, {
    choice_id = "ops_automate_responses"
    risk      = "Medium"
  })
}