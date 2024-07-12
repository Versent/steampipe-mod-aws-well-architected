locals {
  well_architected_framework_sec11_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "application-security"
  })
}

benchmark "well_architected_framework_sec11" {
  title       = "SEC11 How do you incorporate and validate the security properties of applications throughout the design, development, and deployment lifecycle?"
  description = "Training people, testing using automation, understanding dependencies, and validating the security properties of tools and applications help to reduce the likelihood of security issues in production workloads."

  children = [
    benchmark.well_architected_framework_sec11_bp01,
    benchmark.well_architected_framework_sec11_bp02,
    benchmark.well_architected_framework_sec11_bp03,
    benchmark.well_architected_framework_sec11_bp04,
    benchmark.well_architected_framework_sec11_bp05,
    benchmark.well_architected_framework_sec11_bp06,
    benchmark.well_architected_framework_sec11_bp07,
    benchmark.well_architected_framework_sec11_bp08
  ]

  tags = local.well_architected_framework_sec11_common_tags
}

benchmark "well_architected_framework_sec11_bp01" {
  title       = "SEC11-BP01 Train for application security"
  description = "Train for application security to ensure that all team members are aware of best practices and common vulnerabilities."

  children = [
    control.csv_well_architected_framework_sec11_bp01
  ]

  tags = merge(local.well_architected_framework_sec11_common_tags, {
    choice_id = "train_application_security",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec11_bp02" {
  title       = "SEC11-BP02 Automate testing throughout the development and release lifecycle"
  description = "Automate testing throughout the development and release lifecycle to identify and remediate security issues early."

  children = [
    control.csv_well_architected_framework_sec11_bp02
  ]

  tags = merge(local.well_architected_framework_sec11_common_tags, {
    choice_id = "automate_testing",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec11_bp03" {
  title       = "SEC11-BP03 Perform regular penetration testing"
  description = "Perform regular penetration testing to identify vulnerabilities and validate the security posture of applications."

  children = [
    control.csv_well_architected_framework_sec11_bp03
  ]

  tags = merge(local.well_architected_framework_sec11_common_tags, {
    choice_id = "penetration_testing",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec11_bp04" {
  title       = "SEC11-BP04 Manual code reviews"
  description = "Conduct manual code reviews to identify security flaws and ensure adherence to security best practices."

  children = [
    control.csv_well_architected_framework_sec11_bp04
  ]

  tags = merge(local.well_architected_framework_sec11_common_tags, {
    choice_id = "manual_code_reviews",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec11_bp05" {
  title       = "SEC11-BP05 Centralize services for packages and dependencies"
  description = "Centralize services for packages and dependencies to manage and secure third-party software components."

  children = [
    control.csv_well_architected_framework_sec11_bp05
  ]

  tags = merge(local.well_architected_framework_sec11_common_tags, {
    choice_id = "centralize_services",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec11_bp06" {
  title       = "SEC11-BP06 Deploy software programmatically"
  description = "Deploy software programmatically to ensure consistency, repeatability, and security in the deployment process."

  children = [
    control.csv_well_architected_framework_sec11_bp06
  ]

  tags = merge(local.well_architected_framework_sec11_common_tags, {
    choice_id = "programmatic_deployment",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec11_bp07" {
  title       = "SEC11-BP07 Regularly assess security properties of the pipelines"
  description = "Regularly assess security properties of the pipelines to ensure the integrity and security of the software delivery process."

  children = [
    control.csv_well_architected_framework_sec11_bp07
  ]

  tags = merge(local.well_architected_framework_sec11_common_tags, {
    choice_id = "assess_pipelines",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec11_bp08" {
  title       = "SEC11-BP08 Build a program that embeds security ownership in workload teams"
  description = "Build a program that embeds security ownership in workload teams to foster a culture of shared responsibility for security."

  children = [
    control.csv_well_architected_framework_sec11_bp08
  ]

  tags = merge(local.well_architected_framework_sec11_common_tags, {
    choice_id = "embed_security_ownership",
    risk      = "Low"
  })
}

# Controls
control "csv_well_architected_framework_sec11_bp01" {
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
      pillar = 'security' AND best_practise = 'SEC11-BP01'
    EOT
}

control "csv_well_architected_framework_sec11_bp02" {
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
      pillar = 'security' AND best_practise = 'SEC11-BP02'
    EOT
}

control "csv_well_architected_framework_sec11_bp03" {
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
      pillar = 'security' AND best_practise = 'SEC11-BP03'
    EOT
}

control "csv_well_architected_framework_sec11_bp04" {
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
      pillar = 'security' AND best_practise = 'SEC11-BP04'
    EOT
}

control "csv_well_architected_framework_sec11_bp05" {
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
      pillar = 'security' AND best_practise = 'SEC11-BP05'
    EOT
}

control "csv_well_architected_framework_sec11_bp06" {
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
      pillar = 'security' AND best_practise = 'SEC11-BP06'
    EOT
}

control "csv_well_architected_framework_sec11_bp07" {
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
      pillar = 'security' AND best_practise = 'SEC11-BP07'
    EOT
}

control "csv_well_architected_framework_sec11_bp08" {
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
      pillar = 'security' AND best_practise = 'SEC11-BP08'
    EOT
}
