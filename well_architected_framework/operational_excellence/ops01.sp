locals {
  well_architected_framework_ops01_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "dev-integ"
  })
}

benchmark "well_architected_framework_ops01" {
  title       = "OPS01 How do you determine what your priorities are?"
  description = "Everyone should understand their part in enabling business success. Have shared goals in order to set priorities for resources. This will maximize the benefits of your efforts."
  children = [
    benchmark.well_architected_framework_ops01_bp01,
    benchmark.well_architected_framework_ops01_bp02,
    benchmark.well_architected_framework_ops01_bp03,
    benchmark.well_architected_framework_ops01_bp04,
    benchmark.well_architected_framework_ops01_bp05,
    benchmark.well_architected_framework_ops01_bp06
  ]

  tags = local.well_architected_framework_ops01_common_tags
}

benchmark "well_architected_framework_ops01_bp01" {
  title       = "BP01 Evaluate customer needs"
  description = "Involve key stakeholders, including business, development, and operations teams, to determine where to focus efforts on external customer needs. This verifies that you have a thorough understanding of the operations support that is required to achieve your desired business outcomes."

  children = [
    control.csv_well_architected_framework_ops01_bp01
  ]

  tags = merge(local.well_architected_framework_ops01_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops01_bp02" {
  title       = "BP02 Evaluate internal customer needs"
  description = "Involve key stakeholders, including business, development, and operations teams, when determining where to focus efforts on internal customer needs. This will ensure that you have a thorough understanding of the operations support that is required to achieve business outcomes."

  children = [
    control.csv_well_architected_framework_ops01_bp02
  ]

  tags = merge(local.well_architected_framework_ops01_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops01_bp03" {
  title       = "BP03 Evaluate governance requirements"
  description = "Governance is the set of policies, rules, or frameworks that a company uses to achieve its business goals. Governance requirements are generated from within your organization. They can affect the types of technologies you choose or influence the way you operate your workload. Incorporate organizational governance requirements into your workload. Conformance is the ability to demonstrate that you have implemented governance requirements."

  children = [
    control.csv_well_architected_framework_ops01_bp03
  ]

  tags = merge(local.well_architected_framework_ops01_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops01_bp04" {
  title       = "BP04 Evaluate compliance requirements"
  description = "Regulatory, industry, and internal compliance requirements are an important driver for defining your organization’s priorities. Your compliance framework may preclude you from using specific technologies or geographic locations. Apply due diligence if no external compliance frameworks are identified. Generate audits or reports that validate compliance."

  children = [
    control.csv_well_architected_framework_ops01_bp04
  ]

  tags = merge(local.well_architected_framework_ops01_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops01_bp05" {
  title       = "BP05 Evaluate threat landscape"
  description = "Evaluate threats to the business (for example, competition, business risk and liabilities, operational risks, and information security threats) and maintain current information in a risk registry. Include the impact of risks when determining where to focus efforts."

  children = [
    control.csv_well_architected_framework_ops01_bp05
  ]

  tags = merge(local.well_architected_framework_ops01_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_ops01_bp06" {
  title       = "BP06 Evaluate tradeoffs while managing benefits and risks"
  description = "Competing interests from multiple parties can make it challenging to prioritize efforts, build capabilities, and deliver outcomes aligned with business strategies. For example, you may be asked to accelerate speed-to-market for new features over optimizing IT infrastructure costs. This can put two interested parties in conflict with one another. In these situations, decisions need to be brought to a higher authority to resolve conflict. Data is required to remove emotional attachment from the decision-making process."

  children = [
    control.csv_well_architected_framework_ops01_bp06
  ]

  tags = merge(local.well_architected_framework_ops01_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_ops01_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS01-BP01'
    EOT
}

control "csv_well_architected_framework_ops01_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS01-BP02'
    EOT
}

control "csv_well_architected_framework_ops01_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS01-BP03'
    EOT
}

control "csv_well_architected_framework_ops01_bp04" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS01-BP04'
    EOT
}

control "csv_well_architected_framework_ops01_bp05" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS01-BP05'
    EOT
}

control "csv_well_architected_framework_ops01_bp06" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS01-BP06'
    EOT

}