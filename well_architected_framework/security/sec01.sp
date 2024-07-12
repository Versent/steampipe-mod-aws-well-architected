locals {
  well_architected_framework_sec01_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "secure-operations"
  })
}

benchmark "well_architected_framework_sec01" {
  title       = "SEC1 How do you securely operate your workload?"
  description = "To operate your workload securely, you must apply overarching best practices to every area of security. Take requirements and processes that you have defined in operational excellence at an organizational and workload level, and apply them to all areas. Staying up to date with AWS and industry recommendations and threat intelligence helps you evolve your threat model and control objectives. Automating security processes, testing, and validation permit you to scale your security operations."

  children = [
    benchmark.well_architected_framework_sec01_bp01,
    benchmark.well_architected_framework_sec01_bp02,
    benchmark.well_architected_framework_sec01_bp03,
    benchmark.well_architected_framework_sec01_bp04,
    benchmark.well_architected_framework_sec01_bp05,
    benchmark.well_architected_framework_sec01_bp06,
    benchmark.well_architected_framework_sec01_bp07,
    benchmark.well_architected_framework_sec01_bp08
  ]

  tags = local.well_architected_framework_sec01_common_tags
}

benchmark "well_architected_framework_sec01_bp01" {
  title       = "SEC01-BP01 Separate workloads using accounts"
  description = "Separate workloads using accounts to isolate resources and manage security boundaries effectively."

  children = [
    control.csv_well_architected_framework_sec01_bp01,
    aws_compliance.control.account_part_of_organizations
  ]

  tags = merge(local.well_architected_framework_sec01_common_tags, {
    choice_id = "separate_workloads_accounts",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec01_bp02" {
  title       = "SEC01-BP02 Secure account root user and properties"
  description = "Secure the account root user and properties to protect your AWS account from unauthorized access and changes."

  children = [
    control.csv_well_architected_framework_sec01_bp02,
    aws_compliance.control.iam_root_user_hardware_mfa_enabled,
    aws_compliance.control.iam_root_user_mfa_enabled,
    aws_compliance.control.iam_root_user_no_access_keys,
    aws_compliance.control.iam_root_last_used
  ]

  tags = merge(local.well_architected_framework_sec01_common_tags, {
    choice_id = "secure_root_user",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec01_bp03" {
  title       = "SEC01-BP03 Identify and validate control objectives"
  description = "Identify and validate control objectives to ensure that your security controls are effective and meet your requirements."

  children = [
    control.csv_well_architected_framework_sec01_bp03,
    aws_compliance.control.cloudtrail_trail_validation_enabled,
    aws_compliance.control.log_metric_filter_root_login,
    aws_compliance.control.log_metric_filter_console_login_mfa,
    aws_compliance.control.log_metric_filter_disable_or_delete_cmk,
    aws_compliance.control.log_metric_filter_network_acl,
    aws_compliance.control.log_metric_filter_iam_policy,
  ]

  tags = merge(local.well_architected_framework_sec01_common_tags, {
    choice_id = "validate_control_objectives",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec01_bp04" {
  title       = "SEC01-BP04 Stay up to date with security threats and recommendations"
  description = "Stay up to date with security threats and recommendations to ensure that your security practices evolve with the threat landscape."

  children = [
    control.csv_well_architected_framework_sec01_bp04
  ]

  tags = merge(local.well_architected_framework_sec01_common_tags, {
    choice_id = "stay_up_to_date",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec01_bp05" {
  title       = "SEC01-BP05 Reduce security management scope"
  description = "Reduce security management scope to focus on critical areas and improve overall security management efficiency."

  children = [
    control.csv_well_architected_framework_sec01_bp05,
    aws_compliance.control.cloudtrail_s3_data_events_enabled,
    aws_compliance.control.cloudtrail_s3_logging_enabled,
    aws_compliance.control.cloudtrail_trail_enabled,
    aws_compliance.control.cloudtrail_trail_integrated_with_logs,
    aws_compliance.control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    aws_compliance.control.cloudtrail_security_trail_enabled,
    aws_compliance.control.cloudwatch_alarm_action_enabled,
    aws_compliance.control.cloudwatch_alarm_action_enabled_check,
    aws_compliance.control.cloudwatch_cross_account_sharing,
    aws_compliance.control.cloudwatch_log_group_retention_period_365,
    aws_compliance.control.log_group_encryption_at_rest_enabled,
    aws_compliance.control.vpc_flow_logs_enabled,
  ]

  tags = merge(local.well_architected_framework_sec01_common_tags, {
    choice_id = "reduce_management_scope",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec01_bp06" {
  title       = "SEC01-BP06 Automate deployment of standard security controls"
  description = "Automate the deployment of standard security controls to ensure consistency and scalability in your security operations."

  children = [
    control.csv_well_architected_framework_sec01_bp06,
    aws_compliance.control.ec2_instance_ssm_managed,
    aws_compliance.control.ecr_repository_image_scan_on_push_enabled,
    aws_compliance.control.kms_cmk_rotation_enabled,
    aws_compliance.control.secretsmanager_secret_automatic_rotation_enabled,
    aws_compliance.control.secretsmanager_secret_automatic_rotation_lambda_enabled,
  ]

  tags = merge(local.well_architected_framework_sec01_common_tags, {
    choice_id = "automate_security_controls",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec01_bp07" {
  title       = "SEC01-BP07 Identify threats and prioritize mitigations using a threat model"
  description = "Identify threats and prioritize mitigations using a threat model to ensure that you address the most critical security risks."

  children = [
    control.csv_well_architected_framework_sec01_bp07
  ]

  tags = merge(local.well_architected_framework_sec01_common_tags, {
    choice_id = "threat_modeling",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec01_bp08" {
  title       = "SEC01-BP08 Evaluate and implement new security services and features regularly"
  description = "Evaluate and implement new security services and features regularly to ensure that your security posture remains current and effective."

  children = [
    control.csv_well_architected_framework_sec01_bp08,
    aws_compliance.control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values
  ]

  tags = merge(local.well_architected_framework_sec01_common_tags, {
    choice_id = "evaluate_new_services",
    risk      = "Low"
  })
}

# Controls
control "csv_well_architected_framework_sec01_bp01" {
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
      pillar = 'security' AND best_practise = 'SEC01-BP01'
    EOT
}

control "csv_well_architected_framework_sec01_bp02" {
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
      pillar = 'security' AND best_practise = 'SEC01-BP02'
    EOT
}

control "csv_well_architected_framework_sec01_bp03" {
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
      pillar = 'security' AND best_practise = 'SEC01-BP03'
    EOT
}

control "csv_well_architected_framework_sec01_bp04" {
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
      pillar = 'security' AND best_practise = 'SEC01-BP04'
    EOT
}

control "csv_well_architected_framework_sec01_bp05" {
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
      pillar = 'security' AND best_practise = 'SEC01-BP05'
    EOT
}

control "csv_well_architected_framework_sec01_bp06" {
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
      pillar = 'security' AND best_practise = 'SEC01-BP06'
    EOT
}

control "csv_well_architected_framework_sec01_bp07" {
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
      pillar = 'security' AND best_practise = 'SEC01-BP07'
    EOT
}

control "csv_well_architected_framework_sec01_bp08" {
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
      pillar = 'security' AND best_practise = 'SEC01-BP08'
    EOT
}