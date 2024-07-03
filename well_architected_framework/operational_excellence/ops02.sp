locals {
  well_architected_framework_ops02_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "dev-integ"
  })
}

benchmark "well_architected_framework_ops02" {
  title       = "OPS2 How do you structure your organization to support your business outcomes?"
  description = "Your teams must understand their part in achieving business outcomes. Teams should understand their roles in the success of other teams, the role of other teams in their success, and have shared goals. Understanding responsibility, ownership, how decisions are made, and who has authority to make decisions will help focus efforts and maximize the benefits from your teams."

  children = [
    benchmark.well_architected_framework_ops02_bp01,
    benchmark.well_architected_framework_ops02_bp02,
    benchmark.well_architected_framework_ops02_bp03,
    benchmark.well_architected_framework_ops02_bp04,
    benchmark.well_architected_framework_ops02_bp05,
    benchmark.well_architected_framework_ops02_bp06
  ]

  tags = local.well_architected_framework_ops02_common_tags
}

benchmark "well_architected_framework_ops02_bp01" {
  title       = "OPS02-BP01 Resources have identified owners"
  description = "Resources for your workload must have identified owners for change control, troubleshooting, and other functions. Owners are assigned for workloads, accounts, infrastructure, platforms, and applications. Ownership is recorded using tools like a central register or metadata attached to resources. The business value of components informs the processes and procedures applied to them."

  children = [
    control.csv_well_architected_framework_ops02_bp01
  ]

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops02_bp02" {
  title       = "OPS02-BP02 Processes and procedures have identified owners"
  description = "Understand who has ownership of the definition of individual processes and procedures, why those specific process and procedures are used, and why that ownership exists. Understanding the reasons that specific processes and procedures are used aids in identification of improvement opportunities."

  children = [
    control.csv_well_architected_framework_ops02_bp02
  ]

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops02_bp03" {
  title       = "OPS02-BP03 Operations activities have identified owners responsible for their performance"
  description = "Understand who has responsibility to perform specific activities on defined workloads and why that responsibility exists. Understanding who has responsibility to perform activities informs who will conduct the activity, validate the result, and provide feedback to the owner of the activity."

  children = [
    control.csv_well_architected_framework_ops02_bp03
  ]

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops02_bp04" {
  title       = "OPS02-BP04 Mechanisms exist to manage responsibilities and ownership"
  description = "Understand the responsibilities of your role and how you contribute to business outcomes, as this understanding informs the prioritization of your tasks and why your role is important. This helps team members recognize needs and respond appropriately. When team members know their role, they can establish ownership, identify improvement opportunities, and understand how to influence or make appropriate changes."

  children = [
    control.csv_well_architected_framework_ops02_bp04
  ]

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops02_bp05" {
  title       = "OPS02-BP05 Mechanisms exist to request additions, changes, and exceptions"
  description = "You can make requests to owners of processes, procedures, and resources. Requests include additions, changes, and exceptions. These requests go through a change management process. Make informed decisions to approve requests where viable and determined to be appropriate after an evaluation of benefits and risks."

  children = [
    control.csv_well_architected_framework_ops02_bp05
  ]

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

benchmark "well_architected_framework_ops02_bp06" {
  title       = "OPS02-BP06 Responsibilities between teams are predefined or negotiated"
  description = "Have defined or negotiated agreements between teams describing how they work with and support each other (for example, response times, service level objectives, or service-level agreements). Inter-team communications channels are documented. Understanding the impact of the teams’ work on business outcomes and the outcomes of other teams and organizations informs the prioritization of their tasks and helps them respond appropriately."

  children = [
    control.csv_well_architected_framework_ops02_bp06
  ]

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_telemetry_application_telemetry"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_ops02_bp01" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS02-BP01'
    EOT

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops02_bp02" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS02-BP02'
    EOT

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops02_bp03" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS02-BP03'
    EOT

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops02_bp04" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS02-BP04'
    EOT

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "High"
  })
}

control "csv_well_architected_framework_ops02_bp05" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS02-BP05'
    EOT

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "Medium"
  })
}

control "csv_well_architected_framework_ops02_bp06" {
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
      pillar = 'operational-excellence' AND best_practise = 'OPS02-BP06'
    EOT

  tags = merge(local.well_architected_framework_ops02_common_tags, {
    choice_id = "ops_dev_integ_patch_mgmt"
    risk      = "Low"
  })
}