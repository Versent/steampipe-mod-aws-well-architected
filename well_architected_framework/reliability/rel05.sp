locals {
  well_architected_framework_rel05_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "distributed-system-failure-mitigation"
  })
}

benchmark "well_architected_framework_rel05" {
  title       = "REL5 How do you design interactions in a distributed system to mitigate or withstand failures?"
  description = "Distributed systems rely on communications networks to interconnect components (such as servers or services). Your workload must operate reliably despite data loss or latency over these networks. Components of the distributed system must operate in a way that does not negatively impact other components or the workload. These best practices permit workloads to withstand stresses or failures, more quickly recover from them, and mitigate the impact of such impairments. The result is improved mean time to recovery (MTTR)."

  children = [
    benchmark.well_architected_framework_rel05_bp01,
    benchmark.well_architected_framework_rel05_bp02,
    benchmark.well_architected_framework_rel05_bp03,
    benchmark.well_architected_framework_rel05_bp04,
    benchmark.well_architected_framework_rel05_bp05,
    benchmark.well_architected_framework_rel05_bp06,
    benchmark.well_architected_framework_rel05_bp07
  ]

  tags = local.well_architected_framework_rel05_common_tags
}

benchmark "well_architected_framework_rel05_bp01" {
  title       = "REL05-BP01 Implement graceful degradation to transform applicable hard dependencies into soft dependencies"
  description = "Implement graceful degradation to transform hard dependencies into soft dependencies, ensuring that the system can continue to operate, even at a reduced level, when some components fail."

  children = [
    control.csv_well_architected_framework_rel05_bp01
  ]

  tags = merge(local.well_architected_framework_rel05_common_tags, {
    choice_id = "graceful_degradation",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel05_bp02" {
  title       = "REL05-BP02 Throttle requests"
  description = "Throttle requests to prevent overloading the system and to maintain its availability and reliability under heavy load."

  children = [
    control.csv_well_architected_framework_rel05_bp02
  ]

  tags = merge(local.well_architected_framework_rel05_common_tags, {
    choice_id = "throttle_requests",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel05_bp03" {
  title       = "REL05-BP03 Control and limit retry calls"
  description = "Control and limit retry calls to avoid exacerbating failures and to maintain system stability."

  children = [
    control.csv_well_architected_framework_rel05_bp03
  ]

  tags = merge(local.well_architected_framework_rel05_common_tags, {
    choice_id = "limit_retry_calls",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel05_bp04" {
  title       = "REL05-BP04 Fail fast and limit queues"
  description = "Implement fail-fast mechanisms and limit the size of queues to reduce the time to detect and recover from failures."

  children = [
    control.csv_well_architected_framework_rel05_bp04
  ]

  tags = merge(local.well_architected_framework_rel05_common_tags, {
    choice_id = "fail_fast",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel05_bp05" {
  title       = "REL05-BP05 Set client timeouts"
  description = "Set appropriate client timeouts to prevent waiting indefinitely for responses and to detect failures more quickly."

  children = [
    control.csv_well_architected_framework_rel05_bp05
  ]

  tags = merge(local.well_architected_framework_rel05_common_tags, {
    choice_id = "client_timeouts",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel05_bp06" {
  title       = "REL05-BP06 Make systems stateless where possible"
  description = "Make systems stateless where possible to improve scalability and reliability by reducing the dependency on maintaining state information."

  children = [
    control.csv_well_architected_framework_rel05_bp06
  ]

  tags = merge(local.well_architected_framework_rel05_common_tags, {
    choice_id = "stateless_systems",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel05_bp07" {
  title       = "REL05-BP07 Implement emergency levers"
  description = "Implement emergency levers to provide manual control for mitigating failures and maintaining system stability during emergencies."

  children = [
    control.csv_well_architected_framework_rel05_bp07
  ]

  tags = merge(local.well_architected_framework_rel05_common_tags, {
    choice_id = "emergency_levers",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_rel05_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL05-BP01'
    EOT
}

control "csv_well_architected_framework_rel05_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL05-BP02'
    EOT
}

control "csv_well_architected_framework_rel05_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL05-BP03'
    EOT
}

control "csv_well_architected_framework_rel05_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL05-BP04'
    EOT
}

control "csv_well_architected_framework_rel05_bp05" {
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
      pillar = 'reliability' AND best_practise = 'REL05-BP05'
    EOT
}

control "csv_well_architected_framework_rel05_bp06" {
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
      pillar = 'reliability' AND best_practise = 'REL05-BP06'
    EOT
}

control "csv_well_architected_framework_rel05_bp07" {
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
      pillar = 'reliability' AND best_practise = 'REL05-BP07'
    EOT
}