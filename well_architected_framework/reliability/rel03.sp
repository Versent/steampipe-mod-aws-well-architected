locals {
  well_architected_framework_rel03_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "service-architecture"
  })
}

benchmark "well_architected_framework_rel03" {
  title       = "REL3 How do you design your workload service architecture?"
  description = "Build highly scalable and reliable workloads using a service-oriented architecture (SOA) or a microservices architecture. Service-oriented architecture (SOA) is the practice of making software components reusable via service interfaces. Microservices architecture goes further to make components smaller and simpler."

  children = [
    benchmark.well_architected_framework_rel03_bp01,
    benchmark.well_architected_framework_rel03_bp02,
    benchmark.well_architected_framework_rel03_bp03
  ]

  tags = local.well_architected_framework_rel03_common_tags
}

benchmark "well_architected_framework_rel03_bp01" {
  title       = "REL03-BP01 Choose how to segment your workload"
  description = "Choose how to segment your workload into different services to optimize for scalability, reliability, and manageability."

  children = [
    control.csv_well_architected_framework_rel03_bp01
  ]

  tags = merge(local.well_architected_framework_rel03_common_tags, {
    choice_id = "service_segmentation"
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel03_bp02" {
  title       = "REL03-BP02 Build services focused on specific business domains and functionality"
  description = "Build services that are focused on specific business domains and functionalities to ensure that they are highly reusable and maintainable."

  children = [
    control.csv_well_architected_framework_rel03_bp02
  ]

  tags = merge(local.well_architected_framework_rel03_common_tags, {
    choice_id = "business_domain_services"
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel03_bp03" {
  title       = "REL03-BP03 Provide service contracts per API"
  description = "Provide clear service contracts per API to ensure that each service is well-defined and can be easily consumed by other services."

  children = [
    control.csv_well_architected_framework_rel03_bp03
  ]

  tags = merge(local.well_architected_framework_rel03_common_tags, {
    choice_id = "service_contracts"
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_rel03_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL03-BP01'
    EOT
}

control "csv_well_architected_framework_rel03_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL03-BP02'
    EOT
}

control "csv_well_architected_framework_rel03_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL03-BP03'
    EOT
}