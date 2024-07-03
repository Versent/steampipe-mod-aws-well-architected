locals {
  well_architected_framework_ops05_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "ops-reduce-defects"
  })
}

benchmark "well_architected_framework_ops05" {
  title       = "OPS05 How do you reduce defects, ease remediation, and improve flow into production?"
  description = "Adopting approaches that improve the flow of changes into production, activate refactoring, provide fast feedback on quality, and enable bug fixing. These practices accelerate beneficial changes entering production, limit issues deployed, and achieve rapid identification and remediation of issues introduced through deployment activities."

  children = [
    benchmark.well_architected_framework_ops05_bp01,
    benchmark.well_architected_framework_ops05_bp02,
    benchmark.well_architected_framework_ops05_bp03,
    benchmark.well_architected_framework_ops05_bp04,
    benchmark.well_architected_framework_ops05_bp05,
    benchmark.well_architected_framework_ops05_bp06,
    benchmark.well_architected_framework_ops05_bp07,
    benchmark.well_architected_framework_ops05_bp08,
    benchmark.well_architected_framework_ops05_bp09,
    benchmark.well_architected_framework_ops05_bp10
  ]

  tags = local.well_architected_framework_ops05_common_tags
}

benchmark "well_architected_framework_ops05_bp01" {
  title       = "OPS05-BP01 Use version control"
  description = "Implement version control for all changes to ensure traceability, accountability, and rollback capabilities."

  children = [
    control.csv_well_architected_framework_ops05_bp01
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_version_control"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops05_bp02" {
  title       = "OPS05-BP02 Test and validate changes"
  description = "Ensure all changes are tested and validated before deployment to catch issues early and prevent defects in production."

  children = [
    control.csv_well_architected_framework_ops05_bp02
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_testing_validation"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops05_bp03" {
  title       = "OPS05-BP03 Use configuration management systems"
  description = "Utilize configuration management systems to maintain consistency and control over system configurations."

  children = [
    control.csv_well_architected_framework_ops05_bp03
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_configuration_management"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops05_bp04" {
  title       = "OPS05-BP04 Use build and deployment management systems"
  description = "Employ build and deployment management systems to streamline and automate the process, reducing the risk of human error."

  children = [
    control.csv_well_architected_framework_ops05_bp04
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_build_deployment_management"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops05_bp05" {
  title       = "OPS05-BP05 Perform patch management"
  description = "Implement a robust patch management process to ensure all systems are up to date and secure."

  children = [
    control.csv_well_architected_framework_ops05_bp05
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_patch_management"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops05_bp06" {
  title       = "OPS05-BP06 Share design standards"
  description = "Develop and share design standards across teams to ensure consistency and best practices."

  children = [
    control.csv_well_architected_framework_ops05_bp06
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_design_standards"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops05_bp07" {
  title       = "OPS05-BP07 Implement practices to improve code quality"
  description = "Adopt practices such as code reviews, static analysis, and pair programming to improve code quality and reduce defects."

  children = [
    control.csv_well_architected_framework_ops05_bp07
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_code_quality"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops05_bp08" {
  title       = "OPS05-BP08 Use multiple environments"
  description = "Deploy changes to multiple environments (e.g., development, staging, production) to catch issues early and ensure smooth transitions."

  children = [
    control.csv_well_architected_framework_ops05_bp08
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_multiple_environments"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops05_bp09" {
  title       = "OPS05-BP09 Make frequent, small, reversible changes"
  description = "Promote making frequent, small, and reversible changes to minimize risk and simplify rollback if issues arise."

  children = [
    control.csv_well_architected_framework_ops05_bp09
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_small_reversible_changes"
    risk      = "Low"
  })
}

benchmark "well_architected_framework_ops05_bp10" {
  title       = "OPS05-BP10 Fully automate integration and deployment"
  description = "Automate the integration and deployment processes to increase efficiency, reduce errors, and speed up delivery."

  children = [
    control.csv_well_architected_framework_ops05_bp10
  ]

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_automation"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_ops05_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_version_control"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops05_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_testing_validation"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops05_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_configuration_management"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops05_bp04" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP04'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_build_deployment_management"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops05_bp05" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP05'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_patch_management"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops05_bp06" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP06'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_design_standards"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops05_bp07" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP07'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_code_quality"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops05_bp08" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP08'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_multiple_environments"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops05_bp09" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP09'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_small_reversible_changes"
    risk      = "Low"
  })
}

control "csv_well_architected_framework_ops05_bp10" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS05-BP10'
    EOT

  tags = merge(local.well_architected_framework_ops05_common_tags, {
    choice_id = "ops_automation"
    risk      = "High"
  })
}