locals {
  well_architected_framework_rel01_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "service-quotas"
  })
}

benchmark "well_architected_framework_rel01" {
  title       = "REL1 How do you manage Service Quotas and constraints?"
  description = "For cloud-based workload architectures, there are Service Quotas (which are also referred to as service limits). These quotas exist to prevent accidentally provisioning more resources than you need and to limit request rates on API operations so as to protect services from abuse. There are also resource constraints, for example, the rate that you can push bits down a fiber-optic cable, or the amount of storage on a physical disk."
  
  children = [
    benchmark.well_architected_framework_rel01_bp01,
    benchmark.well_architected_framework_rel01_bp02,
    benchmark.well_architected_framework_rel01_bp03,
    benchmark.well_architected_framework_rel01_bp04,
    benchmark.well_architected_framework_rel01_bp05,
    benchmark.well_architected_framework_rel01_bp06
  ]

  tags = local.well_architected_framework_rel01_common_tags
}

benchmark "well_architected_framework_rel01_bp01" {
  title       = "REL01-BP01 Aware of service quotas and constraints"
  description = "Ensure that your team is aware of the service quotas and constraints that apply to your workloads. This helps prevent resource provisioning issues and ensures that you can operate within the limits set by AWS."

  children = [
    control.csv_well_architected_framework_rel01_bp01
  ]

  tags = merge(local.well_architected_framework_rel01_common_tags, {
    choice_id = "service_quotas_awareness"
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel01_bp02" {
  title       = "REL01-BP02 Manage service quotas across accounts and regions"
  description = "Effectively manage service quotas across different AWS accounts and regions to ensure that your workloads can operate without interruption."

  children = [
    control.csv_well_architected_framework_rel01_bp02,
    aws_compliance.control.lambda_function_concurrent_execution_limit_configured
  ]

  tags = merge(local.well_architected_framework_rel01_common_tags, {
    choice_id = "service_quotas_management"
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel01_bp03" {
  title       = "REL01-BP03 Accommodate fixed service quotas and constraints through architecture"
  description = "Design your architecture to accommodate fixed service quotas and constraints. This ensures that your workload can scale appropriately without exceeding service limits."

  children = [
    control.csv_well_architected_framework_rel01_bp03
  ]

  tags = merge(local.well_architected_framework_rel01_common_tags, {
    choice_id = "service_quotas_architecture"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel01_bp04" {
  title       = "REL01-BP04 Monitor and manage quotas"
  description = "Implement monitoring and management processes for service quotas to ensure that you stay within limits and can proactively request quota increases when necessary."

  children = [
    control.csv_well_architected_framework_rel01_bp04
  ]

  tags = merge(local.well_architected_framework_rel01_common_tags, {
    choice_id = "service_quotas_monitoring"
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel01_bp05" {
  title       = "REL01-BP05 Automate quota management"
  description = "Automate the management of service quotas where possible. This reduces the risk of human error and ensures that your workloads can scale efficiently."

  children = [
    control.csv_well_architected_framework_rel01_bp05
  ]

  tags = merge(local.well_architected_framework_rel01_common_tags, {
    choice_id = "service_quotas_automation"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel01_bp06" {
  title       = "REL01-BP06 Ensure that a sufficient gap exists between the current quotas and the maximum usage to accommodate failover"
  description = "Ensure that there is a sufficient gap between your current usage and your service quotas to accommodate failover scenarios. This helps prevent service interruptions during failover events."

  children = [
    control.csv_well_architected_framework_rel01_bp06
  ]

  tags = merge(local.well_architected_framework_rel01_common_tags, {
    choice_id = "service_quotas_failover"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_rel01_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL01-BP01'
    EOT
}

control "csv_well_architected_framework_rel01_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL01-BP02'
    EOT
}

control "csv_well_architected_framework_rel01_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL01-BP03'
    EOT
}

control "csv_well_architected_framework_rel01_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL01-BP04'
    EOT
}

control "csv_well_architected_framework_rel01_bp05" {
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
      pillar = 'reliability' AND best_practise = 'REL01-BP05'
    EOT
}

control "csv_well_architected_framework_rel01_bp06" {
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
      pillar = 'reliability' AND best_practise = 'REL01-BP06'
    EOT
}