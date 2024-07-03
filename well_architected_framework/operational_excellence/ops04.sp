locals {
  well_architected_framework_ops04_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "ops-observability"
  })
}

benchmark "well_architected_framework_ops04" {
  title       = "OPS04 How do you implement observability in your workload?"
  description = "Implementing observability helps you understand the state of your workloads and make data-driven decisions. This includes monitoring key performance indicators, application telemetry, user experience telemetry, dependency telemetry, and distributed tracing."

  children = [
    benchmark.well_architected_framework_ops04_bp01,
    benchmark.well_architected_framework_ops04_bp02,
    benchmark.well_architected_framework_ops04_bp03,
    benchmark.well_architected_framework_ops04_bp04,
    benchmark.well_architected_framework_ops04_bp05
  ]

  tags = local.well_architected_framework_ops04_common_tags
}

benchmark "well_architected_framework_ops04_bp01" {
  title       = "OPS04-BP01 Identify key performance indicators"
  description = "Define and track the key performance indicators (KPIs) that are critical to your business objectives. These indicators help you measure the success and health of your workload."

  children = [
    control.csv_well_architected_framework_ops04_bp01,
    control.cloudtrail_trail_integrated_with_logs
  ]

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_kpi_identification"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops04_bp02" {
  title       = "OPS04-BP02 Implement application telemetry"
  description = "Collect telemetry data from your applications to gain insights into their performance and behavior. This includes metrics, logs, and traces."

  children = [
    control.csv_well_architected_framework_ops04_bp02
  ]

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops04_bp03" {
  title       = "OPS04-BP03 Implement user experience telemetry"
  description = "Collect data on user interactions and experiences to understand how your application is performing from the end-user's perspective. This helps identify and resolve user-facing issues."

  children = [
    control.csv_well_architected_framework_ops04_bp03
  ]

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_user_experience_telemetry"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops04_bp04" {
  title       = "OPS04-BP04 Implement dependency telemetry"
  description = "Monitor the performance and health of dependencies that your application relies on. This includes external services, databases, and third-party APIs."

  children = [
    control.csv_well_architected_framework_ops04_bp04
  ]

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_dependency_telemetry"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops04_bp05" {
  title       = "OPS04-BP05 Implement distributed tracing"
  description = "Implement distributed tracing to track requests as they flow through various components of your application. This helps in diagnosing and resolving issues, and understanding performance bottlenecks."

  children = [
    control.csv_well_architected_framework_ops04_bp05
  ]

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_distributed_tracing"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_ops04_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS04-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_kpi_identification"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops04_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS04-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_application_telemetry"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops04_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS04-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_user_experience_telemetry"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops04_bp04" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS04-BP04'
    EOT

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_dependency_telemetry"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops04_bp05" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS04-BP05'
    EOT

  tags = merge(local.well_architected_framework_ops04_common_tags, {
    choice_id = "ops_distributed_tracing"
    risk      = "High"
  })
}