locals {
  well_architected_framework_rel02_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "network-topology"
  })
}

benchmark "well_architected_framework_rel02" {
  title       = "REL2 How do you plan your network topology?"
  description = "Workloads often exist in multiple environments. These include multiple cloud environments (both publicly accessible and private) and possibly your existing data center infrastructure. Plans must include network considerations such as intra- and intersystem connectivity, public IP address management, private IP address management, and domain name resolution."

  children = [
    benchmark.well_architected_framework_rel02_bp01,
    benchmark.well_architected_framework_rel02_bp02,
    benchmark.well_architected_framework_rel02_bp03,
    benchmark.well_architected_framework_rel02_bp04,
    benchmark.well_architected_framework_rel02_bp05
  ]

  tags = local.well_architected_framework_rel02_common_tags
}

benchmark "well_architected_framework_rel02_bp01" {
  title       = "REL02-BP01 Use highly available network connectivity for your workload public endpoints"
  description = "Ensure that your workload public endpoints use highly available network connectivity to prevent single points of failure and improve reliability."

  children = [
    control.csv_well_architected_framework_rel02_bp01
  ]

  tags = merge(local.well_architected_framework_rel02_common_tags, {
    choice_id = "network_high_availability"
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel02_bp02" {
  title       = "REL02-BP02 Provision redundant connectivity between private networks in the cloud and on-premises environments"
  description = "Provision redundant connectivity between private networks in the cloud and your on-premises environments to ensure continuous network availability."

  children = [
    control.csv_well_architected_framework_rel02_bp02
  ]

  tags = merge(local.well_architected_framework_rel02_common_tags, {
    choice_id = "network_redundancy"
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel02_bp03" {
  title       = "REL02-BP03 Ensure IP subnet allocation accounts for expansion and availability"
  description = "Ensure that your IP subnet allocation plans account for future expansion and availability needs to avoid network fragmentation and to maintain high availability."

  children = [
    control.csv_well_architected_framework_rel02_bp03
  ]

  tags = merge(local.well_architected_framework_rel02_common_tags, {
    choice_id = "network_ip_allocation"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel02_bp04" {
  title       = "REL02-BP04 Prefer hub-and-spoke topologies over many-to-many mesh"
  description = "Prefer hub-and-spoke topologies over many-to-many mesh configurations to simplify management and improve scalability and security."

  children = [
    control.csv_well_architected_framework_rel02_bp04
  ]

  tags = merge(local.well_architected_framework_rel02_common_tags, {
    choice_id = "network_topology"
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel02_bp05" {
  title       = "REL02-BP05 Enforce non-overlapping private IP address ranges in all private address spaces where they are connected"
  description = "Enforce non-overlapping private IP address ranges in all connected private address spaces to avoid IP conflicts and ensure seamless network integration."

  children = [
    control.csv_well_architected_framework_rel02_bp05
  ]

  tags = merge(local.well_architected_framework_rel02_common_tags, {
    choice_id = "network_ip_ranges"
    risk      = "High"
  })
}

# Controls
control "csv_well_architected_framework_rel02_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL02-BP01'
    EOT
}

control "csv_well_architected_framework_rel02_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL02-BP02'
    EOT
}

control "csv_well_architected_framework_rel02_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL02-BP03'
    EOT
}

control "csv_well_architected_framework_rel02_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL02-BP04'
    EOT
}

control "csv_well_architected_framework_rel02_bp05" {
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
      pillar = 'reliability' AND best_practise = 'REL02-BP05'
    EOT
}

#benchmark "well_architected_framework_rel02_bp01" {
#
#    aws_compliance.control.cloudfront_distribution_configured_with_origin_failover,
#    aws_compliance.control.cloudfront_distribution_waf_enabled,
#    aws_compliance.control.elb_application_gateway_network_lb_multiple_az_configured,
#    aws_compliance.control.elb_classic_lb_cross_zone_load_balancing_enabled,
#    aws_compliance.control.elb_classic_lb_multiple_az_configured,
#   aws_compliance.control.lambda_function_multiple_az_configured,
#    aws_compliance.control.rds_db_cluster_multiple_az_enabled,
#    aws_compliance.control.rds_db_instance_multiple_az_enabled,
#    aws_compliance.control.s3_bucket_cross_region_replication_enabled


#benchmark "well_architected_framework_rel02_bp02" {
#
#    aws_compliance.control.ec2_instance_in_vpc,
#    aws_compliance.control.ecs_cluster_instance_in_vpc,
#    aws_compliance.control.es_domain_in_vpc,
#    aws_compliance.control.lambda_function_in_vpc,
#    aws_compliance.control.redshift_cluster_enhanced_vpc_routing_enabled,
#    aws_compliance.control.vpc_vpn_tunnel_up

#WITH endpoint_subnets AS (
#  SELECT
#    vpc_endpoint_id,
#    jsonb_array_elements_text(subnet_ids) AS subnet_id
#  FROM
#    aws_vpc_endpoint
##  WHERE
#    region = 'ap-southeast-2'
#),
#endpoint_counts AS (
#  SELECT
#    vpc_endpoint_id,
#    COUNT(DISTINCT subnet_id) AS distinct_subnet_count
#  FROM
#    endpoint_subnets
##  GROUP BY
#   vpc_endpoint_id
#)
##SELECT
#  vpc_endpoint_id,
#  CASE
#    WHEN distinct_subnet_count >= 2 THEN 'ok'
#    ELSE 'alarm'
#  END AS status
#FROM
#  endpoint_counts
#WHERE
#  distinct_subnet_count >= 2
#UNION ALL
#SELECT
#  vpc_endpoint_id,
#  'alarm' AS status
#FROM
#  endpoint_counts
#WHERE
#  distinct_subnet_count < 2;
