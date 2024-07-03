locals {
  well_architected_framework_ops09_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "ops-health-operations"
  })
}

benchmark "well_architected_framework_ops09" {
  title       = "OPS09 How do you understand the health of your operations?"
  description = "Define, capture, and analyze operations metrics to gain visibility into operations events so that you can take appropriate action."

  children = [
    benchmark.well_architected_framework_ops09_bp01,
    benchmark.well_architected_framework_ops09_bp02,
    benchmark.well_architected_framework_ops09_bp03
  ]

  tags = local.well_architected_framework_ops09_common_tags
}

benchmark "well_architected_framework_ops09_bp01" {
  title       = "OPS09-BP01 Measure operations goals and KPIs with metrics"
  description = "Establish and track key performance indicators (KPIs) and other metrics to assess the achievement of operations goals."

  children = [
    control.csv_well_architected_framework_ops09_bp01
  ]

  tags = merge(local.well_architected_framework_ops09_common_tags, {
    choice_id = "ops_measure_goals_kpis"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops09_bp02" {
  title       = "OPS09-BP02 Communicate status and trends to ensure visibility into operation"
  description = "Regularly communicate the status and trends of operations metrics to stakeholders to maintain transparency and visibility."

  children = [
    control.csv_well_architected_framework_ops09_bp02
  ]

  tags = merge(local.well_architected_framework_ops09_common_tags, {
    choice_id = "ops_communicate_status"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops09_bp03" {
  title       = "OPS09-BP03 Review operations metrics and prioritize improvement"
  description = "Continuously review operations metrics and use the insights to prioritize and implement improvements."

  children = [
    control.csv_well_architected_framework_ops09_bp03
  ]

  tags = merge(local.well_architected_framework_ops09_common_tags, {
    choice_id = "ops_review_prioritize_improvement"
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_ops09_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS09-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops09_common_tags, {
    choice_id = "ops_measure_goals_kpis"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops09_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS09-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops09_common_tags, {
    choice_id = "ops_communicate_status"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops09_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS09-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops09_common_tags, {
    choice_id = "ops_review_prioritize_improvement"
    risk      = "Medium"
  })
}