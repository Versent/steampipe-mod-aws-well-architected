locals {
  well_architected_framework_sec10_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "incident-response"
  })
}

benchmark "well_architected_framework_sec10" {
  title       = "SEC10 How do you anticipate, respond to, and recover from incidents?"
  description = "Even with mature preventive and detective controls, your organization should implement mechanisms to respond to and mitigate the potential impact of security incidents. Your preparation strongly affects the ability of your teams to operate effectively during an incident, to isolate, contain and perform forensics on issues, and to restore operations to a known good state. Putting in place the tools and access ahead of a security incident, then routinely practicing incident response through game days, helps ensure that you can recover while minimizing business disruption."

  children = [
    benchmark.well_architected_framework_sec10_bp01,
    benchmark.well_architected_framework_sec10_bp02,
    benchmark.well_architected_framework_sec10_bp03,
    benchmark.well_architected_framework_sec10_bp04,
    benchmark.well_architected_framework_sec10_bp05,
    benchmark.well_architected_framework_sec10_bp06,
    benchmark.well_architected_framework_sec10_bp07,
    benchmark.well_architected_framework_sec10_bp08
  ]

  tags = local.well_architected_framework_sec10_common_tags
}

benchmark "well_architected_framework_sec10_bp01" {
  title       = "SEC10-BP01 Identify key personnel and external resources"
  description = "Identify key personnel and external resources to ensure a coordinated and effective response to incidents."

  children = [
    control.csv_well_architected_framework_sec10_bp01
  ]

  tags = merge(local.well_architected_framework_sec10_common_tags, {
    choice_id = "identify_key_personnel",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec10_bp02" {
  title       = "SEC10-BP02 Develop incident management plans"
  description = "Develop incident management plans to guide your response to security incidents and minimize impact."

  children = [
    control.csv_well_architected_framework_sec10_bp02
  ]

  tags = merge(local.well_architected_framework_sec10_common_tags, {
    choice_id = "incident_management_plans",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec10_bp03" {
  title       = "SEC10-BP03 Prepare forensic capabilities"
  description = "Prepare forensic capabilities to enable effective investigation and analysis of security incidents."

  children = [
    control.csv_well_architected_framework_sec10_bp03
  ]

  tags = merge(local.well_architected_framework_sec10_common_tags, {
    choice_id = "forensic_capabilities",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec10_bp04" {
  title       = "SEC10-BP04 Develop and test security incident response playbooks"
  description = "Develop and test security incident response playbooks to ensure readiness and effectiveness in handling incidents."

  children = [
    control.csv_well_architected_framework_sec10_bp04
  ]

  tags = merge(local.well_architected_framework_sec10_common_tags, {
    choice_id = "incident_response_playbooks",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec10_bp05" {
  title       = "SEC10-BP05 Pre-provision access"
  description = "Pre-provision access to critical systems and tools to ensure timely response during security incidents."

  children = [
    control.csv_well_architected_framework_sec10_bp05
  ]

  tags = merge(local.well_architected_framework_sec10_common_tags, {
    choice_id = "pre_provision_access",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec10_bp06" {
  title       = "SEC10-BP06 Pre-deploy tools"
  description = "Pre-deploy tools to enable rapid response and mitigation of security incidents."

  children = [
    control.csv_well_architected_framework_sec10_bp06
  ]

  tags = merge(local.well_architected_framework_sec10_common_tags, {
    choice_id = "pre_deploy_tools",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec10_bp07" {
  title       = "SEC10-BP07 Run simulations"
  description = "Run simulations to practice and improve your incident response capabilities."

  children = [
    control.csv_well_architected_framework_sec10_bp07
  ]

  tags = merge(local.well_architected_framework_sec10_common_tags, {
    choice_id = "run_simulations",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec10_bp08" {
  title       = "SEC10-BP08 Establish a framework for learning from incidents"
  description = "Establish a framework for learning from incidents to continuously improve your incident response processes."

  children = [
    control.csv_well_architected_framework_sec10_bp08
  ]

  tags = merge(local.well_architected_framework_sec10_common_tags, {
    choice_id = "learning_from_incidents",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_sec10_bp01" {
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
      pillar = 'security' AND best_practise = 'SEC10-BP01'
    EOT
}

control "csv_well_architected_framework_sec10_bp02" {
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
      pillar = 'security' AND best_practise = 'SEC10-BP02'
    EOT
}

control "csv_well_architected_framework_sec10_bp03" {
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
      pillar = 'security' AND best_practise = 'SEC10-BP03'
    EOT
}

control "csv_well_architected_framework_sec10_bp04" {
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
      pillar = 'security' AND best_practise = 'SEC10-BP04'
    EOT
}

control "csv_well_architected_framework_sec10_bp05" {
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
      pillar = 'security' AND best_practise = 'SEC10-BP05'
    EOT
}

control "csv_well_architected_framework_sec10_bp06" {
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
      pillar = 'security' AND best_practise = 'SEC10-BP06'
    EOT
}

control "csv_well_architected_framework_sec10_bp07" {
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
      pillar = 'security' AND best_practise = 'SEC10-BP07'
    EOT
}

control "csv_well_architected_framework_sec10_bp08" {
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
      pillar = 'security' AND best_practise = 'SEC10-BP08'
    EOT
}
