locals {
  well_architected_framework_sec07_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "data-classification"
  })
}

benchmark "well_architected_framework_sec07" {
  title       = "SEC7 How do you classify your data?"
  description = "Classification provides a way to categorize data, based on criticality and sensitivity in order to help you determine appropriate protection and retention controls."

  children = [
    benchmark.well_architected_framework_sec07_bp01,
    benchmark.well_architected_framework_sec07_bp02,
    benchmark.well_architected_framework_sec07_bp03,
    benchmark.well_architected_framework_sec07_bp04
  ]

  tags = local.well_architected_framework_sec07_common_tags
}

benchmark "well_architected_framework_sec07_bp01" {
  title       = "SEC07-BP01 Understand your data classification scheme"
  description = "Understand your data classification scheme to effectively categorize data based on criticality and sensitivity."

  children = [
    control.csv_well_architected_framework_sec07_bp01
  ]

  tags = merge(local.well_architected_framework_sec07_common_tags, {
    choice_id = "data_classification_scheme",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec07_bp02" {
  title       = "SEC07-BP02 Apply data protection controls based on data sensitivity"
  description = "Apply data protection controls based on data sensitivity to ensure appropriate protection and retention."

  children = [
    control.csv_well_architected_framework_sec07_bp02
  ]

  tags = merge(local.well_architected_framework_sec07_common_tags, {
    choice_id = "data_protection_controls",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec07_bp03" {
  title       = "SEC07-BP03 Automate identification and classification"
  description = "Automate identification and classification to streamline the process and ensure accuracy."

  children = [
    control.csv_well_architected_framework_sec07_bp03
  ]

  tags = merge(local.well_architected_framework_sec07_common_tags, {
    choice_id = "automate_identification_classification",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec07_bp04" {
  title       = "SEC07-BP04 Define scalable data lifecycle management"
  description = "Define scalable data lifecycle management to handle data growth and changing requirements efficiently."

  children = [
    control.csv_well_architected_framework_sec07_bp04
  ]

  tags = merge(local.well_architected_framework_sec07_common_tags, {
    choice_id = "data_lifecycle_management",
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_sec07_bp01" {
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
      pillar = 'security' AND best_practise = 'SEC07-BP01'
    EOT
}

control "csv_well_architected_framework_sec07_bp02" {
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
      pillar = 'security' AND best_practise = 'SEC07-BP02'
    EOT
}

control "csv_well_architected_framework_sec07_bp03" {
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
      pillar = 'security' AND best_practise = 'SEC07-BP03'
    EOT
}

control "csv_well_architected_framework_sec07_bp04" {
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
      pillar = 'security' AND best_practise = 'SEC07-BP04'
    EOT
}
