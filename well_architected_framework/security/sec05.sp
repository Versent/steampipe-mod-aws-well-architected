locals {
  well_architected_framework_sec05_common_tags = merge(local.well_architected_framework_security_common_tags, {
    question_id = "network-protection"
  })
}

benchmark "well_architected_framework_sec05" {
  title       = "SEC05 How do you protect your network resources?"
  description = "Any workload that has some form of network connectivity, whether it's the internet or a private network, requires multiple layers of defense to help protect from external and internal network-based threats."
  children = [
    benchmark.well_architected_framework_sec05_bp01,
    benchmark.well_architected_framework_sec05_bp02,
    benchmark.well_architected_framework_sec05_bp03,
    benchmark.well_architected_framework_sec05_bp04
  ]

  tags = local.well_architected_framework_sec05_common_tags
}

benchmark "well_architected_framework_sec05_bp01" {
  title       = "BP01 Create network layers"
  description = "Group components that share sensitivity requirements into layers to minimize the potential scope of impact of unauthorized access. For example, a database cluster in a virtual private cloud (VPC) with no need for internet access should be placed in subnets with no route to or from the internet. Traffic should only flow from the adjacent next least sensitive resource. Consider a web application sitting behind a load balancer. Your database should not be accessible directly from the load balancer. Only the business logic or web server should have direct access to your database."
  children = [
    control.csv_well_architected_framework_sec05_bp01,
    aws_compliance.control.es_domain_in_vpc,
    aws_compliance.control.opensearch_domain_in_vpc,
    aws_compliance.control.ec2_instance_in_vpc,
    aws_compliance.control.lambda_function_in_vpc,
    aws_compliance.control.redshift_cluster_enhanced_vpc_routing_enabled,
    aws_compliance.control.elb_application_lb_waf_enabled,
    aws_compliance.control.apigateway_stage_use_waf_web_acl,
    aws_compliance.control.cloudfront_distribution_waf_enabled,
    aws_compliance.control.eks_cluster_endpoint_restrict_public_access,
    aws_compliance.control.sagemaker_model_network_isolation_enabled,
    aws_compliance.control.sagemaker_model_in_vpc,
    aws_compliance.control.sagemaker_notebook_instance_in_vpc,
    aws_compliance.control.sagemaker_training_job_network_isolation_enabled,
    aws_compliance.control.sagemaker_training_job_in_vpc
  ]

  tags = merge(local.well_architected_framework_sec05_common_tags, {
    choice_id = "sec_network_protection_create_layers"
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec05_bp02" {
  title       = "SEC05-BP02 Control traffic flow within your network layers"
  description = "Within the layers of your network, use further segmentation to restrict traffic only to the flows necessary for each workload. First, focus on controlling traffic between the internet or other external systems to a workload and your environment (north-south traffic). Afterwards, look at flows between different components and systems (east-west traffic)."
  children = [
    control.csv_well_architected_framework_sec05_bp02,
    aws_compliance.control.dms_replication_instance_not_publicly_accessible,
    aws_compliance.control.ebs_snapshot_not_publicly_restorable,
    aws_compliance.control.ec2_instance_not_use_multiple_enis,
    aws_compliance.control.sagemaker_notebook_instance_direct_internet_access_disabled,
    aws_compliance.control.vpc_subnet_auto_assign_public_ip_disabled,
    aws_compliance.control.vpc_default_security_group_restricts_all_traffic,
    aws_compliance.control.apigateway_rest_api_authorizers_configured,
    aws_compliance.control.s3_bucket_acls_should_prohibit_user_access,
    aws_compliance.control.cis_v150_2_1_3
  ]

  tags = merge(local.well_architected_framework_sec05_common_tags, {
    choice_id = "sec_network_protection_layered"
    risk      = "High"
  })
}

benchmark "well_architected_framework_sec05_bp03" {
  title       = "SEC05-BP03 Implement inspection-based protection"
  description = "Set up traffic inspection points between your network layers to make sure data in transit matches the expected categories and patterns.  Analyze traffic flows, metadata, and patterns to help identify, detect, and respond to events more effectively."
  children = [
    control.csv_well_architected_framework_sec05_bp03,
    aws_compliance.control.dms_replication_instance_not_publicly_accessible,
    aws_compliance.control.autoscaling_launch_config_public_ip_disabled,
    aws_compliance.control.vpc_network_acl_remote_administration,
    aws_compliance.control.vpc_security_group_allows_ingress_authorized_ports,
    aws_compliance.control.cis_v150_5_2,
    aws_compliance.control.vpc_security_group_restrict_ingress_tcp_udp_all,
    aws_compliance.control.vpc_security_group_restrict_ingress_common_ports_all,
    aws_compliance.control.vpc_security_group_restrict_ingress_kafka_port,
    aws_compliance.control.vpc_security_group_restricted_common_ports,
    aws_compliance.control.vpc_security_group_restrict_ingress_redis_port,
    aws_compliance.control.waf_web_acl_rule_attached,
    aws_compliance.control.waf_rule_group_rule_attached,
    aws_compliance.control.vpc_network_acl_unused,
    aws_compliance.control.vpc_default_security_group_restricts_all_traffic,
    aws_compliance.control.ec2_instance_no_launch_wizard_security_group,
    aws_compliance.control.route53_domain_privacy_protection_enabled,
    aws_compliance.control.route53_domain_transfer_lock_enabled
  ]

  tags = merge(local.well_architected_framework_sec05_common_tags, {
    choice_id = "sec_network_protection_auto_protect"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_sec05_bp04" {
  title       = "SEC05-BP04 Automate network protection"
  description = "Automate the deployment of your network protections using DevOps practices, such as infrastructure as code (IaC) and CI/CD pipelines.  These practices can help you track changes in your network protections through a version control system, reduce the time it takes to deploy changes, and help detect if your network protections drift from your desired configuration.  "
  children = [
    control.csv_well_architected_framework_sec05_bp04,
    aws_compliance.control.guardduty_enabled,
    aws_compliance.control.vpc_flow_logs_enabled,
    aws_compliance.control.apigateway_rest_api_authorizers_configured
  ]

  tags = merge(local.well_architected_framework_sec05_common_tags, {
    choice_id = "sec_network_protection_inspection"
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_sec05_bp01" {
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
      pillar = 'security' AND best_practise = 'SEC05-BP01'
    EOT
}

control "csv_well_architected_framework_sec05_bp02" {
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
      pillar = 'security' AND best_practise = 'SEC05-BP02'
    EOT
}

control "csv_well_architected_framework_sec05_bp03" {
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
      pillar = 'security' AND best_practise = 'SEC05-BP03'
    EOT
}

control "csv_well_architected_framework_sec05_bp04" {
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
      pillar = 'security' AND best_practise = 'SEC05-BP04'
    EOT
}
