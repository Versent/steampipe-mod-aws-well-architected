locals {
  well_architected_framework_ops03_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "dev-integ"
  })
}

benchmark "well_architected_framework_ops03" {
  title       = "OPS03 How does your organizational culture support your business outcomes?"
  description = "Your teams must understand their part in achieving business outcomes. Teams should understand their roles in the success of other teams, the role of other teams in their success, and have shared goals. Understanding responsibility, ownership, how decisions are made, and who has authority to make decisions will help focus efforts and maximize the benefits from your teams."

  children = [
    benchmark.well_architected_framework_ops03_bp01,
    benchmark.well_architected_framework_ops03_bp02,
    benchmark.well_architected_framework_ops03_bp03,
    benchmark.well_architected_framework_ops03_bp04,
    benchmark.well_architected_framework_ops03_bp05,
    benchmark.well_architected_framework_ops03_bp06,
    benchmark.well_architected_framework_ops03_bp07
  ]

  tags = local.well_architected_framework_ops03_common_tags
}

benchmark "well_architected_framework_ops03_bp01" {
  title       = "OPS03-BP01 Provide executive sponsorship"
  description = "At the highest level, senior leadership acts as the executive sponsor to clearly set expectations and direction for the organization's outcomes, including evaluating its success. The sponsor advocates and drives adoption of best practices and evolution of the organization."

  children = [
    control.csv_well_architected_framework_ops03_bp01
  ]

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops03_bp02" {
  title       = "OPS03-BP02 Team members are empowered to take action when outcomes are at risk"
  description = "A cultural behavior of ownership instilled by leadership results in any employee feeling empowered to act on behalf of the entire company beyond their defined scope of role and accountability. Employees can act to proactively identify risks as they emerge and take appropriate action. Such a culture allows employees to make high value decisions with situational awareness."

  children = [
    control.csv_well_architected_framework_ops03_bp02
  ]

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops03_bp03" {
  title       = "OPS03-BP03 Escalation is encouraged"
  description = "Team members are encouraged by leadership to escalate issues and concerns to higher-level decision makers and stakeholders if they believe desired outcomes are at risk and expected standards are not met. This is a feature of the organization's culture and is driven at all levels. Escalation should be done early and often so that risks can be identified and prevented from causing incidents. Leadership does not reprimand individuals for escalating an issue."

  children = [
    control.csv_well_architected_framework_ops03_bp03
  ]

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops03_bp04" {
  title       = "OPS03-BP04 Communications are timely, clear, and actionable"
  description = "Leadership is responsible for the creation of strong and effective communications, especially when the organization adopts new strategies, technologies, or ways of working. Leaders should set expectations for all staff to work towards the company objectives. Devise communication mechanisms that create and maintain awareness among the teams responsible for running plans that are funded and sponsored by leadership. Make use of cross-organizational diversity, and listen attentively to multiple unique perspectives. Use this perspective to increase innovation, challenge your assumptions, and reduce the risk of confirmation bias. Foster inclusion, diversity, and accessibility within your teams to gain beneficial perspectives."

  children = [
    control.csv_well_architected_framework_ops03_bp04
  ]

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops03_bp05" {
  title       = "OPS03-BP05 Experimentation is encouraged"
  description = "Experimentation is a catalyst for turning new ideas into products and features. It accelerates learning and keeps team members interested and engaged. Team members are encouraged to experiment often to drive innovation. Even when an undesired result occurs, there is value in knowing what not to do. Team members are not punished for successful experiments with undesired results."

  children = [
    control.csv_well_architected_framework_ops03_bp05
  ]

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops03_bp06" {
  title       = "OPS03-BP06 Team members are encouraged to maintain and grow their skill sets"
  description = "Teams must grow their skill sets to adopt new technologies, and to support changes in demand and responsibilities in support of your workloads. Growth of skills in new technologies is frequently a source of team member satisfaction and supports innovation. Support your team members' pursuit and maintenance of industry certifications that validate and acknowledge their growing skills. Cross train to promote knowledge transfer and reduce the risk of significant impact when you lose skilled and experienced team members with institutional knowledge. Provide dedicated structured time for learning."

  children = [
    control.csv_well_architected_framework_ops03_bp06
  ]

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops03_bp07" {
  title       = "OPS03-BP07 Resource teams appropriately"
  description = "Provision the right amount of proficient team members, and provide tools and resources to support your workload needs. Overburdening team members increases the risk of human error. Investments in tools and resources, such as automation, can scale the effectiveness of your team and help them support a greater number of workloads without requiring additional capacity."

  children = [
    control.csv_well_architected_framework_ops03_bp07
  ]

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_ops03_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS03-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops03_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS03-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops03_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS03-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops03_bp04" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS03-BP04'
    EOT

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops03_bp05" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS03-BP05'
    EOT

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops03_bp06" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS03-BP06'
    EOT

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "Low"
  })
}

control "csv_well_architected_framework_ops03_bp07" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS03-BP07'
    EOT

  tags = merge(local.well_architected_framework_ops03_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "Low"
  })
}