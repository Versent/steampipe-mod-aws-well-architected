locals {
  well_architected_framework_ops11_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "ops-evolve-operations"
  })
}

benchmark "well_architected_framework_ops11" {
  title       = "OPS11 How do you evolve operations?"
  description = "Dedicate time and resources for nearly continuous incremental improvement to evolve the effectiveness and efficiency of your operations."

  children = [
    benchmark.well_architected_framework_ops11_bp01,
    benchmark.well_architected_framework_ops11_bp02,
    benchmark.well_architected_framework_ops11_bp03,
    benchmark.well_architected_framework_ops11_bp04,
    benchmark.well_architected_framework_ops11_bp05,
    benchmark.well_architected_framework_ops11_bp06,
    benchmark.well_architected_framework_ops11_bp07,
    benchmark.well_architected_framework_ops11_bp08,
    benchmark.well_architected_framework_ops11_bp09
  ]

  tags = local.well_architected_framework_ops11_common_tags
}

benchmark "well_architected_framework_ops11_bp01" {
  title       = "OPS11-BP01 Have a process for continuous improvement"
  description = "Establish a structured process for continuous improvement to regularly assess and enhance operations."

  children = [
    control.csv_well_architected_framework_ops11_bp01
  ]

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_continuous_improvement"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops11_bp02" {
  title       = "OPS11-BP02 Perform post-incident analysis"
  description = "Conduct thorough post-incident analysis to understand root causes and prevent future incidents."

  children = [
    control.csv_well_architected_framework_ops11_bp02
  ]

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_post_incident_analysis"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops11_bp03" {
  title       = "OPS11-BP03 Implement feedback loops"
  description = "Create feedback loops to continuously gather and act on information from operations and stakeholders."

  children = [
    control.csv_well_architected_framework_ops11_bp03
  ]

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_feedback_loops"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops11_bp04" {
  title       = "OPS11-BP04 Perform knowledge management"
  description = "Implement knowledge management practices to ensure information is captured, stored, and shared effectively."

  children = [
    control.csv_well_architected_framework_ops11_bp04
  ]

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_knowledge_management"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops11_bp05" {
  title       = "OPS11-BP05 Define drivers for improvement"
  description = "Identify and define drivers that motivate and guide the continuous improvement of operations."

  children = [
    control.csv_well_architected_framework_ops11_bp05
  ]

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_improvement_drivers"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops11_bp06" {
  title       = "OPS11-BP06 Validate insights"
  description = "Regularly validate insights and assumptions to ensure they are based on accurate and up-to-date information."

  children = [
    control.csv_well_architected_framework_ops11_bp06
  ]

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_validate_insights"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops11_bp07" {
  title       = "OPS11-BP07 Perform operations metrics reviews"
  description = "Conduct regular reviews of operations metrics to identify areas for improvement and track progress."

  children = [
    control.csv_well_architected_framework_ops11_bp07
  ]

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_metrics_reviews"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops11_bp08" {
  title       = "OPS11-BP08 Document and share lessons learned"
  description = "Document and share lessons learned from operations to promote continuous learning and improvement."

  children = [
    control.csv_well_architected_framework_ops11_bp08
  ]

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_lessons_learned"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops11_bp09" {
  title       = "OPS11-BP09 Allocate time to make improvements"
  description = "Dedicate time and resources to implementing improvements identified through continuous review and analysis."

  children = [
    control.csv_well_architected_framework_ops11_bp09
  ]

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_time_allocation_improvements"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_ops11_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS11-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_continuous_improvement"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops11_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS11-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_post_incident_analysis"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops11_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS11-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_feedback_loops"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops11_bp04" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS11-BP04'
    EOT

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_knowledge_management"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops11_bp05" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS11-BP05'
    EOT

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_improvement_drivers"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops11_bp06" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS11-BP06'
    EOT

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_validate_insights"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops11_bp07" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS11-BP07'
    EOT

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_metrics_reviews"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops11_bp08" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS11-BP08'
    EOT

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_lessons_learned"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops11_bp09" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS11-BP09'
    EOT

  tags = merge(local.well_architected_framework_ops11_common_tags, {
    choice_id = "ops_time_allocation_improvements"
    risk      = "High"
  })
}