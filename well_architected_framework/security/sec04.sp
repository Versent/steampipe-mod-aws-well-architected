locals {
  well_architected_framework_sec04_common_tags = merge(local.well_architected_framework_security_common_tags, {
    question_id = "detect-investigate-events"
  })
}

benchmark "well_architected_framework_sec04" {
  title       = "SEC04 How do you detect and investigate security events?"
  description = "Capture and analyze events from logs and metrics to gain visibility. Take action on security events and potential threats to help secure your workload."
  children = [
    benchmark.well_architected_framework_sec04_bp01,
    benchmark.well_architected_framework_sec04_bp02,
    benchmark.well_architected_framework_sec04_bp03,
    benchmark.well_architected_framework_sec04_bp04
  ]

  tags = local.well_architected_framework_sec04_common_tags
}

benchmark "well_architected_framework_sec04_bp01" {
  title       = "BP01 Configure service and application logging"
  description = "Retain security event logs from services and applications. This is a fundamental principle of security for audit, investigations, and operational use cases, and a common security requirement driven by governance, risk, and compliance (GRC) standards, policies, and procedures.An organization should be able to reliably and consistently retrieve security event logs from AWS services and applications in a timely manner when required to fulfill an internal process or obligation, such as a security incident response. Consider centralizing logs for better operational results."
  children = [
    control.csv_well_architected_framework_sec04_bp01,
    aws_compliance.control.apigateway_stage_logging_enabled,
    aws_compliance.control.opensearch_domain_audit_logging_enabled,
    aws_compliance.control.cloudtrail_trail_integrated_with_logs,
    aws_compliance.control.cloudtrail_s3_data_events_enabled,
    aws_compliance.control.acm_certificate_transparency_logging_enabled,
    aws_compliance.control.lambda_function_cloudtrail_logging_enabled,
    aws_compliance.control.cloudfront_distribution_logging_enabled,
    aws_compliance.control.cis_v150_3_10,
    aws_compliance.control.cis_v130_3_11,
    aws_compliance.control.eks_cluster_control_plane_audit_logging_enabled,
    aws_compliance.control.elb_application_classic_lb_logging_enabled,
    aws_compliance.control.rds_db_instance_cloudwatch_logs_enabled,
    aws_compliance.control.redshift_cluster_audit_logging_enabled,
    aws_compliance.control.route53_zone_query_logging_enabled,
    aws_compliance.control.s3_bucket_object_logging_enabled,
    aws_compliance.control.vpc_flow_logs_enabled
  ]

  tags = merge(local.well_architected_framework_sec04_common_tags, {
    choice_id = "sec_detect_investigate_events_app_service_logging"
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec04_bp02" {
  title       = "SEC04-BP02 Capture logs, findings, and metrics in standardized locations"
  description = "Security teams rely on logs and findings to analyze events that may indicate unauthorized activity or unintentional changes. To streamline this analysis, capture security logs and findings in standardized locations.  This makes data points of interest available for correlation and can simplify tool integrations."
  children = [
    control.csv_well_architected_framework_sec04_bp02,
    aws_compliance.control.es_domain_logs_to_cloudwatch,
    aws_compliance.control.cloudtrail_multi_region_trail_enabled,
    aws_compliance.control.rds_db_instance_logging_enabled,
    aws_compliance.control.vpc_flow_logs_enabled,
    aws_compliance.control.wafv2_web_acl_logging_enabled,
    aws_compliance.control.cloudtrail_security_trail_enabled,
    aws_compliance.control.redshift_cluster_audit_logging_enabled,
    aws_compliance.control.config_enabled_all_regions
  ]

  tags = merge(local.well_architected_framework_sec04_common_tags, {
    choice_id = "sec_detect_investigate_events_analyze_all"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec04_bp03" {
  title       = "SEC04-BP03 Correlate and enrich security alerts"
  description = "Unexpected activity can generate multiple security alerts by different sources, requiring further correlation and enrichment to understand the full context. Implement automated correlation and enrichment of security alerts to help achieve more accurate incident identification and response."
  children = [
    control.csv_well_architected_framework_sec04_bp03,
    aws_compliance.control.es_domain_logs_to_cloudwatch,
    aws_compliance.control.elb_application_classic_lb_logging_enabled,
    aws_compliance.control.cloudtrail_multi_region_trail_enabled,
    aws_compliance.control.rds_db_instance_logging_enabled,
    aws_compliance.control.vpc_flow_logs_enabled,
    aws_compliance.control.wafv2_web_acl_logging_enabled,
    aws_compliance.control.cloudtrail_security_trail_enabled,
    aws_compliance.control.redshift_cluster_audit_logging_enabled,
  ]

  tags = merge(local.well_architected_framework_sec04_common_tags, {
    choice_id = "sec_detect_investigate_events_auto_response"
    risk      = "Low"
  })
}

benchmark "well_architected_framework_sec04_bp04" {
  title       = "SEC04-BP04 Initiate remediation for non-compliant resources"
  description = "Your detective controls may alert on resources that are out of compliance with your configuration requirements. You can initiate programmatically-defined remediations, either manually or automatically, to fix these resources and help minimize potential impacts. When you define remediations programmatically, you can take prompt and consistent action."
  children = [
    control.csv_well_architected_framework_sec04_bp04
  ]

  tags = merge(local.well_architected_framework_sec04_common_tags, {
    choice_id = "sec_detect_investigate_events_auto_response"
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_sec04_bp01" {
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
      pillar = 'security' AND best_practise = 'SEC04-BP01'
    EOT
}

control "csv_well_architected_framework_sec04_bp02" {
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
      pillar = 'security' AND best_practise = 'SEC04-BP02'
    EOT
}

control "csv_well_architected_framework_sec04_bp03" {
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
      pillar = 'security' AND best_practise = 'SEC04-BP03'
    EOT
}

control "csv_well_architected_framework_sec04_bp04" {
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
      pillar = 'security' AND best_practise = 'SEC04-BP04'
    EOT
}

control "cloudtrail_trail_integrated_with_logs" {
  title = "Customer Response"

  sql = <<EOT
select
  arn as resource,
  case
    when log_group_arn is not null 
      and (is_organization_trail = true and (latest_delivery_time is null or latest_delivery_time > current_date - interval '1 day'))
      then 'ok'
    when log_group_arn is not null 
      and (is_organization_trail = false and latest_delivery_time > current_date - interval '1 day')
      then 'ok'
   else 'alarm'
  end as status,
  case
    when log_group_arn is not null 
      and (is_organization_trail = true and (latest_delivery_time is null or latest_delivery_time > current_date - interval '1 day'))
      then title || ' integrated with CloudWatch logs (organization trail).'
    when log_group_arn is not null 
      and (is_organization_trail = false and latest_delivery_time > current_date - interval '1 day')
      then title || ' integrated with CloudWatch logs.'
    when is_organization_trail = true 
      and log_group_arn is not null 
      then title || ' integrated with CloudWatch logs owned by another account (organization trail).'
    else title || ' not integrated with CloudWatch logs.'
  end as reason,
  region,
  account_id
from
  aws_cloudtrail_trail
where
  region = home_region;
    EOT
}