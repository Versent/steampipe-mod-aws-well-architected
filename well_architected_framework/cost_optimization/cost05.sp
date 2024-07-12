locals {
  well_architected_framework_cost05_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "cost-evaluation"
  })
}

benchmark "well_architected_framework_cost05" {
  title       = "COST5 How do you evaluate cost when you select services?"
  description = "Amazon EC2, Amazon EBS, and Amazon S3 are building-block AWS services. Managed services, such as Amazon RDS and Amazon DynamoDB, are higher level, or application level, AWS services. By selecting the appropriate building blocks and managed services, you can optimize this workload for cost. For example, using managed services, you can reduce or remove much of your administrative and operational overhead, freeing you to work on applications and business-related activities."

  children = [
    benchmark.well_architected_framework_cost05_bp01,
    benchmark.well_architected_framework_cost05_bp02,
    benchmark.well_architected_framework_cost05_bp03,
    benchmark.well_architected_framework_cost05_bp04,
    benchmark.well_architected_framework_cost05_bp05,
    benchmark.well_architected_framework_cost05_bp06
  ]

  tags = local.well_architected_framework_cost05_common_tags
}

benchmark "well_architected_framework_cost05_bp01" {
  title       = "COST05-BP01 Identify organization requirements for cost"
  description = "Identify organization requirements for cost to ensure that cost considerations are aligned with business objectives."

  children = [
    control.csv_well_architected_framework_cost05_bp01
  ]

  tags = merge(local.well_architected_framework_cost05_common_tags, {
    choice_id = "identify_cost_requirements",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost05_bp02" {
  title       = "COST05-BP02 Analyze all components of the workload"
  description = "Analyze all components of the workload to identify areas for cost optimization."

  children = [
    control.csv_well_architected_framework_cost05_bp02
  ]

  tags = merge(local.well_architected_framework_cost05_common_tags, {
    choice_id = "analyze_workload_components",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost05_bp03" {
  title       = "COST05-BP03 Perform a thorough analysis of each component"
  description = "Perform a thorough analysis of each component to ensure that cost optimization opportunities are identified and addressed."

  children = [
    control.csv_well_architected_framework_cost05_bp03
  ]

  tags = merge(local.well_architected_framework_cost05_common_tags, {
    choice_id = "thorough_component_analysis",
    risk      = "High"
  })
}

benchmark "well_architected_framework_cost05_bp04" {
  title       = "COST05-BP04 Select software with cost-effective licensing"
  description = "Select software with cost-effective licensing to minimize software licensing costs."

  children = [
    control.csv_well_architected_framework_cost05_bp04
  ]

  tags = merge(local.well_architected_framework_cost05_common_tags, {
    choice_id = "cost_effective_software_licensing",
    risk      = "Low"
  })
}

benchmark "well_architected_framework_cost05_bp05" {
  title       = "COST05-BP05 Select components of this workload to optimize cost in line with organization priorities"
  description = "Select components of this workload to optimize cost in line with organization priorities to ensure that spending aligns with business goals."

  children = [
    control.csv_well_architected_framework_cost05_bp05
  ]

  tags = merge(local.well_architected_framework_cost05_common_tags, {
    choice_id = "optimize_workload_components",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_cost05_bp06" {
  title       = "COST05-BP06 Perform cost analysis for different usage over time"
  description = "Perform cost analysis for different usage over time to understand cost trends and optimize spending accordingly."

  children = [
    control.csv_well_architected_framework_cost05_bp06
  ]

  tags = merge(local.well_architected_framework_cost05_common_tags, {
    choice_id = "cost_analysis_over_time",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_cost05_bp01" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST05-BP01'
    EOT
}

control "csv_well_architected_framework_cost05_bp02" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST05-BP02'
    EOT
}

control "csv_well_architected_framework_cost05_bp03" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST05-BP03'
    EOT
}

control "csv_well_architected_framework_cost05_bp04" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST05-BP04'
    EOT
}

control "csv_well_architected_framework_cost05_bp05" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST05-BP05'
    EOT
}

control "csv_well_architected_framework_cost05_bp06" {
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
      pillar = 'cost_optimization' AND best_practise = 'COST05-BP06'
    EOT
}
