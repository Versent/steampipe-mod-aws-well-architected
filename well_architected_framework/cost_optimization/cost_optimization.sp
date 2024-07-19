locals {
  well_architected_framework_cost_optimization_common_tags = merge(local.well_architected_framework_common_tags, {
    pillar_id = "costOptimization"
  })
}

benchmark "well_architected_framework_cost_optimization" {
  title       = "Cost optimization"
  description = "The Cost Optimization pillar includes the ability to run systems to deliver business value at the lowest price point."
  children = [
    benchmark.well_architected_framework_cost01,
    benchmark.well_architected_framework_cost02,
    benchmark.well_architected_framework_cost03,
    benchmark.well_architected_framework_cost04,
    benchmark.well_architected_framework_cost05,
    benchmark.well_architected_framework_cost06,
    benchmark.well_architected_framework_cost07,
    benchmark.well_architected_framework_cost08,
    benchmark.well_architected_framework_cost09,
    benchmark.well_architected_framework_cost10,
    benchmark.well_architected_framework_cost11
  ]

  tags = local.well_architected_framework_cost_optimization_common_tags
}
