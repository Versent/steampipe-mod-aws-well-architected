locals {
  well_architected_framework_rel06_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "workload-monitoring"
  })
}

benchmark "well_architected_framework_rel06" {
  title       = "REL6 How do you monitor workload resources?"
  description = "Logs and metrics are powerful tools to gain insight into the health of your workload. You can configure your workload to monitor logs and metrics and send notifications when thresholds are crossed or significant events occur. Monitoring allows your workload to recognize when low-performance thresholds are crossed or failures occur, so it can recover automatically in response."

  children = [
    benchmark.well_architected_framework_rel06_bp01,
    benchmark.well_architected_framework_rel06_bp02,
    benchmark.well_architected_framework_rel06_bp03,
    benchmark.well_architected_framework_rel06_bp04,
    benchmark.well_architected_framework_rel06_bp05,
    benchmark.well_architected_framework_rel06_bp06,
    benchmark.well_architected_framework_rel06_bp07
  ]

  tags = local.well_architected_framework_rel06_common_tags
}

benchmark "well_architected_framework_rel06_bp01" {
  title       = "REL06-BP01 Monitor all components for the workload (Generation)"
  description = "Monitor all components of your workload to ensure you have complete visibility into its health and performance."

  children = [
    control.csv_well_architected_framework_rel06_bp01
  ]

  tags = merge(local.well_architected_framework_rel06_common_tags, {
    choice_id = "monitor_all_components",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel06_bp02" {
  title       = "REL06-BP02 Define and calculate metrics (Aggregation)"
  description = "Define and calculate metrics for your workload to understand its performance and health over time."

  children = [
    control.csv_well_architected_framework_rel06_bp02
  ]

  tags = merge(local.well_architected_framework_rel06_common_tags, {
    choice_id = "define_calculate_metrics",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel06_bp03" {
  title       = "REL06-BP03 Send notifications (Real-time processing and alarming)"
  description = "Send notifications when thresholds are crossed or significant events occur to ensure timely awareness and response."

  children = [
    control.csv_well_architected_framework_rel06_bp03
  ]

  tags = merge(local.well_architected_framework_rel06_common_tags, {
    choice_id = "send_notifications",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel06_bp04" {
  title       = "REL06-BP04 Automate responses (Real-time processing and alarming)"
  description = "Automate responses to thresholds being crossed or significant events to ensure quick recovery and minimize impact."

  children = [
    control.csv_well_architected_framework_rel06_bp04
  ]

  tags = merge(local.well_architected_framework_rel06_common_tags, {
    choice_id = "automate_responses",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel06_bp05" {
  title       = "REL06-BP05 Analyze logs"
  description = "Analyze logs regularly to gain insights into the performance and health of your workload."

  children = [
    control.csv_well_architected_framework_rel06_bp05
  ]

  tags = merge(local.well_architected_framework_rel06_common_tags, {
    choice_id = "analyze_logs",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel06_bp06" {
  title       = "REL06-BP06 Conduct reviews regularly"
  description = "Conduct regular reviews of your monitoring data to ensure ongoing performance and health of your workload."

  children = [
    control.csv_well_architected_framework_rel06_bp06
  ]

  tags = merge(local.well_architected_framework_rel06_common_tags, {
    choice_id = "conduct_reviews",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel06_bp07" {
  title       = "REL06-BP07 Monitor end-to-end tracing of requests through your system"
  description = "Monitor end-to-end tracing of requests through your system to understand how they flow and to identify any performance bottlenecks."

  children = [
    control.csv_well_architected_framework_rel06_bp07
  ]

  tags = merge(local.well_architected_framework_rel06_common_tags, {
    choice_id = "end_to_end_tracing",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_rel06_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL06-BP01'
    EOT
}

control "csv_well_architected_framework_rel06_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL06-BP02'
    EOT
}

control "csv_well_architected_framework_rel06_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL06-BP03'
    EOT
}

control "csv_well_architected_framework_rel06_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL06-BP04'
    EOT
}

control "csv_well_architected_framework_rel06_bp05" {
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
      pillar = 'reliability' AND best_practise = 'REL06-BP05'
    EOT
}

control "csv_well_architected_framework_rel06_bp06" {
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
      pillar = 'reliability' AND best_practise = 'REL06-BP06'
    EOT
}

control "csv_well_architected_framework_rel06_bp07" {
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
      pillar = 'reliability' AND best_practise = 'REL06-BP07'
    EOT
}

#benchmark "well_architected_framework_rel06_bp01" {
#  children = [
#    aws_compliance.control.ec2_instance_detailed_monitoring_enabled,
#    aws_compliance.control.apigateway_stage_logging_enabled,
#    aws_compliance.control.acm_certificate_transparency_logging_enabled,
#    aws_compliance.control.codebuild_project_logging_enabled,
#    aws_compliance.control.ecs_task_definition_logging_enabled,
#    aws_compliance.control.elb_application_classic_lb_logging_enabled,
#    aws_compliance.control.lambda_function_cloudtrail_logging_enabled,
#    aws_compliance.control.opensearch_domain_audit_logging_enabled,
#    aws_compliance.control.rds_db_instance_logging_enabled,
#    aws_compliance.control.route53_zone_query_logging_enabled,
#    aws_compliance.control.s3_bucket_logging_enabled,
#    aws_compliance.control.s3_bucket_object_logging_enabled,
#    aws_compliance.control.waf_web_acl_logging_enabled

#benchmark "well_architected_framework_rel06_bp02" {
#  children = [
#    aws_compliance.control.ecs_cluster_container_insights_enabled,
#    aws_compliance.control.elastic_beanstalk_enhanced_health_reporting_enabled
