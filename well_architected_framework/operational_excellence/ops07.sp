locals {
  well_architected_framework_ops07_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "ops-support-readiness"
  })
}

benchmark "well_architected_framework_ops07" {
  title       = "OPS07 How do you know that you are ready to support a workload?"
  description = "Evaluate the operational readiness of your workload, processes, procedures, and personnel to understand the operational risks related to your workload."

  children = [
    benchmark.well_architected_framework_ops07_bp01,
    benchmark.well_architected_framework_ops07_bp02,
    benchmark.well_architected_framework_ops07_bp03,
    benchmark.well_architected_framework_ops07_bp04,
    benchmark.well_architected_framework_ops07_bp05,
    benchmark.well_architected_framework_ops07_bp06
  ]

  tags = local.well_architected_framework_ops07_common_tags
}

benchmark "well_architected_framework_ops07_bp01" {
  title       = "OPS07-BP01 Ensure personnel capability"
  description = "Ensure that your personnel have the necessary skills and training to support the workload effectively."

  children = [
    control.csv_well_architected_framework_ops07_bp01
  ]

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_personnel_capability"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops07_bp02" {
  title       = "OPS07-BP02 Ensure a consistent review of operational readiness"
  description = "Regularly review the operational readiness of your systems and processes to ensure they meet required standards."

  children = [
    control.csv_well_architected_framework_ops07_bp02
  ]

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_operational_readiness_review"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops07_bp03" {
  title       = "OPS07-BP03 Use runbooks to perform procedures"
  description = "Develop and use runbooks to standardize the execution of operational procedures."

  children = [
    control.csv_well_architected_framework_ops07_bp03
  ]

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_runbooks"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops07_bp04" {
  title       = "OPS07-BP04 Use playbooks to investigate issues"
  description = "Create and utilize playbooks to guide the investigation and resolution of operational issues."

  children = [
    control.csv_well_architected_framework_ops07_bp04
  ]

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_playbooks"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops07_bp05" {
  title       = "OPS07-BP05 Make informed decisions to deploy systems and changes"
  description = "Ensure decisions to deploy systems and changes are based on thorough evaluations and risk assessments."

  children = [
    control.csv_well_architected_framework_ops07_bp05
  ]

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_informed_deployment_decisions"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops07_bp06" {
  title       = "OPS07-BP06 Create support plans for production workloads"
  description = "Develop comprehensive support plans for production workloads to ensure they are maintained and supported effectively."

  children = [
    control.csv_well_architected_framework_ops07_bp06
  ]

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_support_plans"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_ops07_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS07-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_personnel_capability"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops07_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS07-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_operational_readiness_review"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops07_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS07-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_runbooks"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops07_bp04" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS07-BP04'
    EOT

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_playbooks"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops07_bp05" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS07-BP05'
    EOT

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_informed_deployment_decisions"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops07_bp06" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS07-BP06'
    EOT

  tags = merge(local.well_architected_framework_ops07_common_tags, {
    choice_id = "ops_support_plans"
    risk      = "High"
  })
}