locals {
  well_architected_framework_sustainability_common_tags = merge(local.well_architected_framework_common_tags, {
    pillar_id = "Sustainability"
  })
}

benchmark "well_architected_framework_sustainability" {
  title       = "Sustainability"
  description = "The Sustainability pillar includes understanding the impacts of the services used, quantifying impacts through the entire workload lifecycle, and applying design principles and best practices to reduce these impacts when building cloud workloads."
  children = [
    benchmark.well_architected_framework_sus01,
    benchmark.well_architected_framework_sus02,
    benchmark.well_architected_framework_sus03,
    benchmark.well_architected_framework_sus04,
    benchmark.well_architected_framework_sus05,
  ]

  tags = local.well_architected_framework_performance_common_tags
}
