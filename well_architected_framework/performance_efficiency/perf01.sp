locals {
  well_architected_framework_perf01_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "performance-efficiency"
  })
}

benchmark "well_architected_framework_perf01" {
  title       = "PERF1 How do you select appropriate cloud resources and architecture for your workload?"
  description = "The optimal solution for a particular workload varies, and solutions often combine multiple approaches. Well-Architected workloads use multiple solutions and allow different features to improve performance."

  children = [
    benchmark.well_architected_framework_perf01_bp01,
    benchmark.well_architected_framework_perf01_bp02,
    benchmark.well_architected_framework_perf01_bp03,
    benchmark.well_architected_framework_perf01_bp04,
    benchmark.well_architected_framework_perf01_bp05,
    benchmark.well_architected_framework_perf01_bp06,
    benchmark.well_architected_framework_perf01_bp07
  ]

  tags = local.well_architected_framework_perf01_common_tags
}

benchmark "well_architected_framework_perf01_bp01" {
  title       = "PERF01-BP01 Learn about and understand available cloud services and features"
  description = "Learn about and understand available cloud services and features to select the best options for your workload."

  children = [
    control.csv_well_architected_framework_perf01_bp01
  ]

  tags = merge(local.well_architected_framework_perf01_common_tags, {
    choice_id = "learn_about_services",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf01_bp02" {
  title       = "PERF01-BP02 Use guidance from your cloud provider or an appropriate partner to learn about architecture patterns and best practices"
  description = "Use guidance from your cloud provider or an appropriate partner to learn about architecture patterns and best practices."

  children = [
    control.csv_well_architected_framework_perf01_bp02
  ]

  tags = merge(local.well_architected_framework_perf01_common_tags, {
    choice_id = "use_guidance",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf01_bp03" {
  title       = "PERF01-BP03 Factor cost into architectural decisions"
  description = "Factor cost into architectural decisions to ensure that your workload is both efficient and cost-effective."

  children = [
    control.csv_well_architected_framework_perf01_bp03
  ]

  tags = merge(local.well_architected_framework_perf01_common_tags, {
    choice_id = "factor_cost",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf01_bp04" {
  title       = "PERF01-BP04 Evaluate how trade-offs impact customers and architecture efficiency"
  description = "Evaluate how trade-offs impact customers and architecture efficiency to make informed decisions."

  children = [
    control.csv_well_architected_framework_perf01_bp04
  ]

  tags = merge(local.well_architected_framework_perf01_common_tags, {
    choice_id = "evaluate_tradeoffs",
    risk      = "High"
  })
}

benchmark "well_architected_framework_perf01_bp05" {
  title       = "PERF01-BP05 Use policies and reference architectures"
  description = "Use policies and reference architectures to streamline architectural decisions and improve consistency."

  children = [
    control.csv_well_architected_framework_perf01_bp05
  ]

  tags = merge(local.well_architected_framework_perf01_common_tags, {
    choice_id = "use_policies",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf01_bp06" {
  title       = "PERF01-BP06 Use benchmarking to drive architectural decisions"
  description = "Use benchmarking to drive architectural decisions and ensure that your solutions are performing as expected."

  children = [
    control.csv_well_architected_framework_perf01_bp06
  ]

  tags = merge(local.well_architected_framework_perf01_common_tags, {
    choice_id = "use_benchmarking",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_perf01_bp07" {
  title       = "PERF01-BP07 Use a data-driven approach for architectural choices"
  description = "Use a data-driven approach for architectural choices to make informed decisions based on actual performance data."

  children = [
    control.csv_well_architected_framework_perf01_bp07
  ]

  tags = merge(local.well_architected_framework_perf01_common_tags, {
    choice_id = "data_driven_choices",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_perf01_bp01" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF01-BP01'
    EOT
}

control "csv_well_architected_framework_perf01_bp02" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF01-BP02'
    EOT
}

control "csv_well_architected_framework_perf01_bp03" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF01-BP03'
    EOT
}

control "csv_well_architected_framework_perf01_bp04" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF01-BP04'
    EOT
}

control "csv_well_architected_framework_perf01_bp05" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF01-BP05'
    EOT
}

control "csv_well_architected_framework_perf01_bp06" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF01-BP06'
    EOT
}

control "csv_well_architected_framework_perf01_bp07" {
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
      pillar = 'performance_efficiency' AND best_practise = 'PERF01-BP07'
    EOT
}