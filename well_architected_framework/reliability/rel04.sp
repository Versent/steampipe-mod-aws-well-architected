locals {
  well_architected_framework_rel04_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "distributed-system-interactions"
  })
}

benchmark "well_architected_framework_rel04" {
  title       = "REL4 How do you design interactions in a distributed system to prevent failures?"
  description = "Distributed systems rely on communications networks to interconnect components, such as servers or services. Your workload must operate reliably despite data loss or latency in these networks. Components of the distributed system must operate in a way that does not negatively impact other components or the workload. These best practices prevent failures and improve mean time between failures (MTBF)."

  children = [
    benchmark.well_architected_framework_rel04_bp01,
    benchmark.well_architected_framework_rel04_bp02,
    benchmark.well_architected_framework_rel04_bp03,
    benchmark.well_architected_framework_rel04_bp04
  ]

  tags = local.well_architected_framework_rel04_common_tags
}

benchmark "well_architected_framework_rel04_bp01" {
  title       = "REL04-BP01 Identify the kind of distributed systems you depend on"
  description = "Identify the different kinds of distributed systems your workload depends on to ensure you can design for and mitigate potential points of failure."

  children = [
    control.csv_well_architected_framework_rel04_bp01
  ]

  tags = merge(local.well_architected_framework_rel04_common_tags, {
    choice_id = "distributed_system_identification",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel04_bp02" {
  title       = "REL04-BP02 Implement loosely coupled dependencies"
  description = "Implement loosely coupled dependencies to ensure that the failure or latency of one component does not negatively impact other components or the overall workload."

  children = [
    control.csv_well_architected_framework_rel04_bp02
  ]

  tags = merge(local.well_architected_framework_rel04_common_tags, {
    choice_id = "loose_coupling",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel04_bp03" {
  title       = "REL04-BP03 Do constant work"
  description = "Design your components to do constant work to avoid sudden spikes in load that can lead to failures."

  children = [
    control.csv_well_architected_framework_rel04_bp03
  ]

  tags = merge(local.well_architected_framework_rel04_common_tags, {
    choice_id = "constant_work",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel04_bp04" {
  title       = "REL04-BP04 Make all responses idempotent"
  description = "Ensure that all responses from your services are idempotent, meaning that performing the same operation multiple times will produce the same result. This helps to prevent unintended side effects from retries."

  children = [
    control.csv_well_architected_framework_rel04_bp04
  ]

  tags = merge(local.well_architected_framework_rel04_common_tags, {
    choice_id = "idempotent_responses",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_rel04_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL04-BP01'
    EOT
}

control "csv_well_architected_framework_rel04_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL04-BP02'
    EOT
}

control "csv_well_architected_framework_rel04_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL04-BP03'
    EOT
}

control "csv_well_architected_framework_rel04_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL04-BP04'
    EOT
}