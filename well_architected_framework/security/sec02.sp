locals {
  well_architected_framework_sec02_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "authentication-management"
  })
}

benchmark "well_architected_framework_sec02" {
  title       = "SEC2 How do you manage authentication for people and machines?"
  description = "There are two types of identities that you must manage when approaching operating secure AWS workloads. Understanding the type of identity you must manage and grant access helps you verify the right identities have access to the right resources under the right conditions."

  children = [
    benchmark.well_architected_framework_sec02_bp01,
    benchmark.well_architected_framework_sec02_bp02,
    benchmark.well_architected_framework_sec02_bp03,
    benchmark.well_architected_framework_sec02_bp04,
    benchmark.well_architected_framework_sec02_bp05,
    benchmark.well_architected_framework_sec02_bp06
  ]

  tags = local.well_architected_framework_sec02_common_tags
}

benchmark "well_architected_framework_sec02_bp01" {
  title       = "SEC02-BP01 Use strong sign-in mechanisms"
  description = "Use strong sign-in mechanisms to ensure that only authorized identities can access your AWS resources."

  children = [
    control.csv_well_architected_framework_sec02_bp01,
    aws_compliance.control.iam_account_password_policy_strong_min_reuse_24,
    aws_compliance.control.iam_user_hardware_mfa_enabled,
    aws_compliance.control.iam_user_mfa_enabled,
    aws_compliance.control.iam_user_console_access_mfa_enabled,
    aws_compliance.control.iam_root_user_no_access_keys,
    aws_compliance.control.iam_user_with_administrator_access_mfa_enabled,
    aws_compliance.control.sagemaker_notebook_instance_root_access_disabled
  ]

  tags = merge(local.well_architected_framework_sec02_common_tags, {
    choice_id = "strong_sign_in",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec02_bp02" {
  title       = "SEC02-BP02 Use temporary credentials"
  description = "Use temporary credentials to minimize the risk of credential compromise and to ensure that access is granted only when necessary."

  children = [
    control.csv_well_architected_framework_sec02_bp02,
    aws_compliance.control.iam_user_access_key_age_90,
    aws_compliance.control.iam_user_unused_credentials_90,
    aws_compliance.control.secretsmanager_secret_automatic_rotation_enabled,
    aws_compliance.control.secretsmanager_secret_last_changed_90_day,
    aws_compliance.control.secretsmanager_secret_rotated_as_scheduled,
    aws_compliance.control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.well_architected_framework_sec02_common_tags, {
    choice_id = "temporary_credentials",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec02_bp03" {
  title       = "SEC02-BP03 Store and use secrets securely"
  description = "Store and use secrets securely to protect sensitive information and ensure that it is accessible only to authorized entities."

  children = [
    control.csv_well_architected_framework_sec02_bp03,
    aws_compliance.control.cloudformation_stack_output_no_secrets,
    aws_compliance.control.ec2_instance_user_data_no_secrets,
    aws_compliance.control.ecs_task_definition_container_environment_no_secret
  ]

  tags = merge(local.well_architected_framework_sec02_common_tags, {
    choice_id = "secure_secrets",
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec02_bp04" {
  title       = "SEC02-BP04 Rely on a centralized identity provider"
  description = "Rely on a centralized identity provider to simplify identity management and ensure consistency in access control."

  children = [
    control.csv_well_architected_framework_sec02_bp04,
    control.iam_identity_center_present
  ]

  tags = merge(local.well_architected_framework_sec02_common_tags, {
    choice_id = "centralized_identity",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec02_bp05" {
  title       = "SEC02-BP05 Audit and rotate credentials periodically"
  description = "Audit and rotate credentials periodically to minimize the risk of credential compromise and ensure that access remains secure."

  children = [
    control.csv_well_architected_framework_sec02_bp05,
    aws_compliance.control.iam_user_access_key_age_90,
    aws_compliance.control.kms_cmk_rotation_enabled,
    aws_compliance.control.secretsmanager_secret_automatic_rotation_enabled
  ]

  tags = merge(local.well_architected_framework_sec02_common_tags, {
    choice_id = "audit_rotate_credentials",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec02_bp06" {
  title       = "SEC02-BP06 Employ user groups and attributes"
  description = "Employ user groups and attributes to simplify access management and ensure that access is granted based on the principle of least privilege."

  children = [
    control.csv_well_architected_framework_sec02_bp06
  ]

  tags = merge(local.well_architected_framework_sec02_common_tags, {
    choice_id = "user_groups_attributes",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_sec02_bp01" {
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
      pillar = 'security' AND best_practise = 'SEC02-BP01'
    EOT
}

control "csv_well_architected_framework_sec02_bp02" {
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
      pillar = 'security' AND best_practise = 'SEC02-BP02'
    EOT
}

control "csv_well_architected_framework_sec02_bp03" {
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
      pillar = 'security' AND best_practise = 'SEC02-BP03'
    EOT
}

control "csv_well_architected_framework_sec02_bp04" {
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
      pillar = 'security' AND best_practise = 'SEC02-BP04'
    EOT
}

control "csv_well_architected_framework_sec02_bp05" {
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
      pillar = 'security' AND best_practise = 'SEC02-BP05'
    EOT
}

control "csv_well_architected_framework_sec02_bp06" {
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
      pillar = 'security' AND best_practise = 'SEC02-BP06'
    EOT
}

control "iam_identity_center_present" {
  title = "Check for the use of AWS Identity Center"

  sql = <<EOT
    with saml_providers as (
      select
        arn,
        region,
        account_id
      from
        aws_iam_saml_provider
      where
        arn like '%AWSSSO_%_DO_NOT_DELETE%'
    )
    select
      arn as resource,
      case
        when count(arn) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(arn) > 0 then 'AWS Identity Center is in use.'
        else 'AWS Identity Center is not in use.'
      end as reason,
      region,
      account_id
    from
      saml_providers
    group by
      arn, region, account_id;
    EOT
}
