locals {
  well_architected_framework_sec06_common_tags = merge(local.well_architected_framework_security_common_tags, {
    question_id = "protect-compute"
  })
}

benchmark "well_architected_framework_sec06" {
  title       = "SEC06 How do you protect your compute resources?"
  description = "Compute resources in your workload require multiple layers of defense to help protect from external and internal threats. Compute resources include EC2 instances, containers, AWS Lambda functions, database services, IoT devices, and more."
  children = [
    benchmark.well_architected_framework_sec06_bp01,
    benchmark.well_architected_framework_sec06_bp02,
    benchmark.well_architected_framework_sec06_bp03,
    benchmark.well_architected_framework_sec06_bp04,
    benchmark.well_architected_framework_sec06_bp05,
  ]

  tags = local.well_architected_framework_sec06_common_tags
}

benchmark "well_architected_framework_sec06_bp01" {
  title       = "BP01 Perform vulnerability management"
  description = "Frequently scan and patch for vulnerabilities in your code, dependencies, and in your infrastructure to help protect against new threats. Create and maintain a vulnerability management program. Regularly scan and patch resources such as Amazon EC2 instances, Amazon Elastic Container Service (Amazon ECS) containers, and Amazon Elastic Kubernetes Service (Amazon EKS) workloads. Configure maintenance windows for AWS managed resources, such as Amazon Relational Database Service (Amazon RDS) databases. Use static code scanning to inspect application source code for common issues. Consider web application penetration testing if your organization has the requisite skills or can hire outside assistance."
  children = [
    control.csv_well_architected_framework_sec06_bp01,
    aws_compliance.control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    aws_compliance.control.cloudtrail_trail_validation_enabled,
    aws_compliance.control.cloudtrail_security_trail_enabled,
    aws_compliance.control.ec2_instance_uses_imdsv2,
    aws_compliance.control.ec2_instance_publicly_accessible_iam_profile_attached,
    aws_compliance.control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.well_architected_framework_sec06_common_tags, {
    choice_id = "sec_protect_compute_vulnerability_management"
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec06_bp02" {
  title       = "SEC06-BP02 Provision compute from hardened images"
  description = "Provide fewer opportunities for unintended access to your runtime environments by deploying them from hardened images. Only acquire runtime dependencies, such as container images and application libraries, from trusted registries and verify their signatures. Create your own private registries to store trusted images and libraries for use in your build and deploy processes."
  children = [
    control.csv_well_architected_framework_sec06_bp02,
    aws_compliance.control.lambda_function_in_vpc,
    aws_compliance.control.ecs_cluster_container_insights_enabled,
    aws_compliance.control.ecs_service_fargate_using_latest_platform_version
  ]

  tags = merge(local.well_architected_framework_sec06_common_tags, {
    choice_id = "sec_protect_compute_reduce_surface"
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec06_bp03" {
  title       = "SEC06-BP03 Reduce manual management and interactive access"
  description = "Use automation to perform deployment, configuration, maintenance, and investigative tasks wherever possible. Consider manual access to compute resources in cases of emergency procedures or in safe (sandbox) environments, when automation is not available."
  children = [
    control.csv_well_architected_framework_sec06_bp03,
    aws_compliance.control.redshift_cluster_maintenance_settings_check,
    aws_compliance.control.ec2_instance_not_use_multiple_enis
  ]

  tags = merge(local.well_architected_framework_sec06_common_tags, {
    choice_id = "sec_protect_compute_implement_managed_services"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec06_bp04" {
  title       = "SEC06-BP04 Validate software integrity"
  description = "Use cryptographic verification to validate the integrity of software artifacts (including images) your workload uses.  Cryptographically sign your software as a safeguard against unauthorized changes run within your compute environments."
  children = [
    control.csv_well_architected_framework_sec06_bp04,
    aws_compliance.control.ec2_instance_iam_profile_attached,
    aws_compliance.control.ec2_instance_ssm_managed,
    aws_compliance.control.ec2_instance_not_use_multiple_enis,
    aws_compliance.control.ec2_stopped_instance_30_days
  ]

  tags = merge(local.well_architected_framework_sec06_common_tags, {
    choice_id = "sec_protect_compute_auto_protection"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec06_bp05" {
  title       = "SEC06-BP05 Automate compute protection"
  description = "Automate compute protection operations to reduce the need for human intervention. Use automated scanning to detect potential issues within your compute resources, and remediate with automated programmatic responses or fleet management operations.  Incorporate automation in your CI/CD processes to deploy trustworthy workloads with up-to-date dependencies."
  children = [
    control.csv_well_architected_framework_sec06_bp05,
    aws_compliance.control.ec2_instance_iam_profile_attached,
    aws_compliance.control.ec2_instance_ssm_managed,
    aws_compliance.control.ec2_instance_not_use_multiple_enis,
    aws_compliance.control.ec2_stopped_instance_30_days
  ]

  tags = merge(local.well_architected_framework_sec06_common_tags, {
    choice_id = "sec_protect_compute_actions_distance"
    risk      = "low"
  })
}

# Controls
control "csv_well_architected_framework_sec06_bp01" {
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
      pillar = 'security' AND best_practise = 'SEC06-BP01'
    EOT
}

control "csv_well_architected_framework_sec06_bp02" {
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
      pillar = 'security' AND best_practise = 'SEC06-BP02'
    EOT
}

control "csv_well_architected_framework_sec06_bp03" {
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
      pillar = 'security' AND best_practise = 'SEC06-BP03'
    EOT
}

control "csv_well_architected_framework_sec06_bp04" {
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
      pillar = 'security' AND best_practise = 'SEC06-BP04'
    EOT
}

control "csv_well_architected_framework_sec06_bp05" {
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
      pillar = 'security' AND best_practise = 'SEC06-BP05'
    EOT
}
