# Cost Optimisation

Assumption:

- The responses are based on a AWS Landing Zone build and NOT related to setting up of a Cloud of Excellence team.
  - Decisions are organisations IT Strategy on centralised or decentralised operating model will inform responses.

## Terminology Consistency

Alignment of terminology and glossary of terms would be beneficial to customers and internal teams.

- AWS Foundations or AWS Landing Zone?
- Cloud Centre of Excellence or Cloud Team?

## [Practice Cloud Financial Management]

### COST 1. How do you implement cloud financial management?

#### Implementing Cloud Financial Management enables organizations to realize business value and financial success as they optimize their cost and usage and scale on AWS.

| Activity                                                                | Applicable | Reason                                                                                                                                                                                                                                                                                                         | Value add proposition                                   |
| ----------------------------------------------------------------------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| [COST01-BP01 Establish ownership of cost optimization]                  | No         | Collobrative process to establish who will own which areas of cost optimisation, not in scope for Landing Zone build                                                                                                                                                                                           | Enablement of [AWS Cost Optimisation]                   |
| [COST01-BP02 Establish a partnership between finance and technology]    | Yes        | Providing the Finance team the relevant permissions and process to review spend. Increasingly important is allowing this to be self-service and not have the technology teams be a bottleneck.                                                                                                                 |                                                         |
| [COST01-BP03 Establish cloud budgets and forecasts]                     | Yes        | Enablement of budgets with notifications to relevant stakeholders against forecasted and actual spend                                                                                                                                                                                                          |                                                         |
| [COST01-BP04 Implement cost awareness in your organizational processes] | No         | Focus on organisational process is around ensuring cost awareness is included in the process. Implementation of tooling is captured under [COST01-BP06 Monitor cost proactively] .                                                                                                                             |                                                         |
| [COST01-BP05 Report and notify on cost optimization]                    | No         | Reporting of cost optimisations should be driven through application teams and the dedicated FinOps team as it often requires in-depth knowledge of the application workloads that the central platform team will not have. Implementation of tooling is captured under [COST01-BP06 Monitor cost proactively] |                                                         |
| [COST01-BP06 Monitor cost proactively]                                  | Yes        | Enable alerts based on forecasting and anomaly detection on behalf of workload teams                                                                                                                                                                                                                           | Enable of anomaly detection                             |
| [COST01-BP07 Keep up-to-date with new service releases]                 | Yes        | With many AWS releases producing cost benefits, advising application teams of optmisations can bring significant savings to operating of the platform. For example, new generation of hardware often come with lower price point and better performance.                                                       | Customer mailing list of new releases and optimisations |
| [COST01-BP08 Create a cost-aware culture]                               | No         | While enablement of the ability to view costs in the AWS Account can be done by the AWS Foundations team, the team should not have to drive the cost-aware culture within the organisation.                                                                                                                    |                                                         |
| [COST01-BP09 Quantify business value from cost optimization]            | No         | A large majority of cost optimisation stems from the operating of application workloads and to a lesser extent the operating of the AWS Foundation                                                                                                                                                             |                                                         |

## [Expenditure and usage awareness]

### COST 2. How do you govern usage?

#### Establish policies and mechanisms to ensure that appropriate costs are incurred while objectives are achieved. By employing a checks-and-balances approach, you can innovate without overspending.

| Activity                                                               | Applicable | Reason                                                                                                                    | Value add proposition                            |
| ---------------------------------------------------------------------- | ---------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| [COST02-BP01 Develop policies based on your organization requirements] | Yes        | Enforcement and observability of policy compliance through centralised tools such as AWS Config and AWS Organisation SCPs | Custom dashboard for enterprise compliance       |
| [COST02-BP02 Implement goals and targets]                              | Yes        | Enforcement of agreed standards and goals - including benchmarks and KPIs                                                 | Establishment of [Cloud Intelligence Dashboards] |
| [COST02-BP03 Implement an account structure]                           | Yes        | Creation of AWS accounts within the AWS Foundations team remit                                                            |                                                  |
| [COST02-BP04 Implement groups and roles]                               | Yes        | AWS groups and roles typically created through [AWS IAM Identity Center]                                                  |                                                  |
| [COST02-BP05 Implement cost controls]                                  | Yes        | Implementation of notifications, and also enforcement of services (for example particular instance types)                 | Setup of [AWS Cost Anomaly Detection]            |
| [COST02-BP06 Track project lifecycle]                                  | No         | Cloud Centre of Excellance team must establish a project lifecycle monitoring process                                     |                                                  |

## Monitor cost and usage

### COST 3. How do you monitor your cost and usage?

#### Establish policies and procedures to monitor and appropriately allocate your costs. This allows you to measure and improve the cost efficiency of this workload.

| Activity                                                     | Applicable | Reason                                                                                                                                                                                                                     | Value add proposition                                          |
| ------------------------------------------------------------ | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| [COST03-BP01 Configure detailed information sources]         | No         | Detailed views of application breakdown should be performed by the application teams that have the most in-depth understanding of the application components                                                               |                                                                |
| [COST03-BP02 Add organization information to cost and usage] | Yes        | Creation of the organisation taggimg schema to be done collabratively amongst finance, technical teams an the cloud teams. Implementation of Tagging enforcement through AWS Organisation controls is strongly encouraged. | Produce dashboard based on compliance to organisation standard |
| [COST03-BP03 Identify cost attribution categories]           | No         | Process to identify how cost attribution will be completed within the organisation, no tied specifically to AWS Landing Zone build                                                                                         |                                                                |
| [COST03-BP04 Establish organization metrics]                 | No         | Estabishment of the organisation metrics in relation to the AWS Landing Zone not coupled to build process                                                                                                                  |                                                                |
| [COST03-BP05 Configure billing and cost management tools]    | Yes        | As relates to previous items like [COST01-BP01 Establish ownership of cost optimization], [COST02-BP05 Implement cost controls]                                                                                            |                                                                |
| [COST03-BP06 Allocate costs based on workload metrics]       | No         | Implementation of the analytics services should be enabled through optimisation of the allocation process                                                                                                                  | Cost allocation dashboards                                     |

## [Decommission resources]

### COST 4. How do you decommission resources?

#### Implement change control and resource management from project inception to end-of-life. This ensures you shut down or terminate unused resources to reduce waste.

| Activity                                           | Applicable | Reason                                                                                                                | Value add proposition |
| -------------------------------------------------- | ---------- | --------------------------------------------------------------------------------------------------------------------- | --------------------- |
| [COST04-BP01 Track resources over their lifetime]  | No         | Implementation of [AWS Config] is only requirement from the AWS Foundations team                                      |                       |
| [COST04-BP02 Implement a decommissioning process]  | No         | Workload specific implementation                                                                                      |                       |
| [COST04-BP03 Decommission resources]               | No         | Workload specific implementation                                                                                      |                       |
| [COST04-BP04 Decommission resources automatically] | No         | Workload specific implementation - for example use of auto-scaling groups for moving wastage outside of typical usage |                       |
| [COST04-BP05 Enforce data retention policies]      | No         | Workload specific implementation - for example AWS S3 bucket retention policies                                       |                       |

## [Cost effective resources]

### COST 5. How do you evaluate cost when you select services?

#### Amazon EC2, Amazon EBS, and Amazon S3 are building-block AWS services. Managed services, such as Amazon RDS and Amazon DynamoDB, are higher level, or application level, AWS services. By selecting the appropriate building blocks and managed services, you can optimize this workload for cost. For example, using managed services, you can reduce or remove much of your administrative and operational overhead, freeing you to work on applications and business-related activities.

| Activity                                                                                               | Applicable | Reason                                                                                                                                                                                                                       | Value add proposition |
| ------------------------------------------------------------------------------------------------------ | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| [COST05-BP01 Identify organization requirements for cost]                                              | No         | Organisation cross functional team to identify how technical debt and backlogs of work are worked through                                                                                                                    |                       |
| [COST05-BP02 Analyze all components of the workload]                                                   | No         | In-depth anaylsis of application components to be completed by the application team                                                                                                                                          |                       |
| [COST05-BP03 Perform a thorough analysis of each component]                                            | No         | In-depth anaylsis of application component to be completed by the application team                                                                                                                                           |                       |
| [COST05-BP04 Select software with cost-effective licensing]                                            | No         | Licensing costs to be assessed by individual application teams. Overall organisation IT strategy may guide to buy Vs build approach                                                                                          |                       |
| [COST05-BP05 Select components of this workload to optimize cost in line with organization priorities] | No         | Organisation IT strategy may guide towards buy if typically the workforce does not have strength in building solutions. Priortising managed services where possible can be a very cost effective method to create solutions. |                       |
| [COST05-BP06 Perform cost analysis for different usage over time]                                      | No         | Application team to prime activities and use the tools available to assess cost. This may include pre-purchasing compute units as usage is well understood.                                                                  |                       |

## [Select the correct resource type, size, and number]

### COST 6. How do you meet cost targets when you select resource type, size and number?

#### Ensure that you choose the appropriate resource size and number of resources for the task at hand. You minimize waste by selecting the most cost effective type, size, and number.

| Activity                                                                            | Applicable | Reason                                                                                                                                                                                                                                                                         | Value add proposition |
| ----------------------------------------------------------------------------------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------- |
| [COST06-BP01 Perform cost modeling]                                                 | Yes        | Effective modeling of core provided constructs like networking and security/goverance tools to be provided to the application teams. For example, ephemeral jobs that create elastic network interface with high frequency can produce exponentially large [AWS Config] costs. |                       |
| [COST06-BP02 Select resource type, size, and number based on data]                  | No         | The AWS Foundation team can provide expertise based on passed experience, while this is no relevant for an Landing Zone build                                                                                                                                                  |                       |
| [COST06-BP03 Select resource type, size, and number automatically based on metrics] | No         | The AWS Foundation team can provide expertise based on passed experience, while this is no relevant for an Landing Zone build                                                                                                                                                  |                       |
| [COST06-BP04 Consider using shared resources]                                       | Yes        | Use of shared-services such as Identity Federation and Centralised Networking are key examples of deployment of shared resources for cost (and security) efficiency.                                                                                                           |                       |

## [Select the best pricing model]

### COST 7. How do you use pricing models to reduce cost?

#### Use the pricing model that is most appropriate for your resources to minimize expense.

| Activity                                                                     | Applicable | Reason                                                                                                                                                                                                                                | Value add proposition |
| ---------------------------------------------------------------------------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| [COST07-BP01 Perform pricing model analysis]                                 | No         | The AWS Foundation team can provide expertise based on passed experience, while this is no relevant for an Landing Zone build                                                                                                         |                       |
| [COST07-BP02 Choose Regions based on cost]                                   | Yes        | Relevant for the AWS Foundations build as a HOME_REGION should be selected where majority of workloads will be provisioned. For Australian customers, given Sydney is the only fully fledged region, most workloads will reside here. |                       |
| [COST07-BP03 Select third-party agreements with cost-efficient terms]        | Yes        | Relevant for the AWS Foundation team for core services like NextGeneration Firewalls                                                                                                                                                  |                       |
| [COST07-BP04 Implement pricing models for all components of this workload]   | No         | The AWS Foundation team can provide guidance and present standard instance types that can be purchased across the entire organisation.                                                                                                |                       |
| [COST07-BP05 Perform pricing model analysis at the management account level] | No         | The AWS Foundation team wll be responsible for re-evaluating the effectiveness of the purchased savings plans.                                                                                                                        |

## [Plan for data transfer]

### COST 8. How do you plan for data transfer charges?

#### Ensure that you plan and monitor data transfer charges so that you can make architectural decisions to minimize costs. A small yet effective architectural change can drastically reduce your operational costs over time.

| Activity                                                       | Applicable | Reason                                                                                                                                                                                                                                                                                                                 | Value add proposition |
| -------------------------------------------------------------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| [COST08-BP01 Perform data transfer modeling]                   | No         | While the networking model as provided by the AWS Foundation will cover data transfer, the application design will inform the costings                                                                                                                                                                                 |                       |
| [COST08-BP02 Select components to optimize data transfer cost] | Yes        | The networking model, particularly if centralised, can be provide cost effectiveness when the hourly charges (if applicable) are consolidated across multiple accounts                                                                                                                                                 |                       |
| [COST08-BP03 Implement services to reduce data transfer costs] | Yes        | Implementation of services like VPC Endpoints and NAT gateways for service connectivity and egress internet traffic reduces the hourly cost charge as consolidated across multiple accounts. Workload accounts may want to take advantage of services like Amazon Cloudfront for low latency and caching capabilities. |                       |

## [Manage demand and supply resources]

### COST 9. How do you manage demand, and supply resources?

#### For a workload that has balanced spend and performance, ensure that everything you pay for is used and avoid significantly underutilizing instances. A skewed utilization metric in either direction has an adverse impact on your organization, in either operational costs (degraded performance due to over-utilization), or wasted AWS expenditures (due to over-provisioning).

| Activity                                                      | Applicable | Reason                                                                                                                                                                                                                                     | Value add proposition                  |
| ------------------------------------------------------------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------- |
| [COST09-BP01 Perform an analysis on the workload demand]      | No         | AWS Foundation team can provide guidance and expertise while the Application Workload team should drive the activity looking at historical data of the workloads                                                                           |                                        |
| [COST09-BP02 Implement a buffer or throttle to manage demand] | No         | Application Workload Teams should implement buffers on supported services like AWS API Gateway and implement services like SQS to help manage demand.                                                                                      |                                        |
| [COST09-BP03 Supply resources dynamically]                    | No         | Similarly to [COST04-BP04 Decommission resources automatically], Application Workload teams can use services like [AWS Auto Scaling] to dynamically match demand. AWS Foundation team can implement the [AWS Instance Scheduler] solution. | Deployment of [AWS Instance Scheduler] |

## [Optimize over time]

### COST 10. How do you evaluate new services?

#### As AWS releases new services and features, it's a best practice to review your existing architectural decisions to ensure they continue to be the most cost effective.

| Activity                                                 | Applicable | Reason                                                                                                               | Value add proposition |
| -------------------------------------------------------- | ---------- | -------------------------------------------------------------------------------------------------------------------- | --------------------- |
| [COST10-BP01 Develop a workload review process]          | No         | AWS Foundation team can provide guidance and expertise while the Application Workload team should drive the activity |                       |
| [COST10-BP02 Review and analyze this workload regularly] | No         | AWS Foundation team can provide guidance and expertise while the Application Workload team should drive the activity |                       |

### COST 11. How do you evaluate the cost of effort?

#### As AWS releases new services and features, it's a best practice to review the cost of the effort required to implement new services.

| Activity                                        | Applicable | Reason                                                                                                                                                                | Value add proposition       |
| ----------------------------------------------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| [COST11-BP01 Perform automation for operations] | Yes        | If the AWS Foundation team provides services centrally such as backing up of resources, ensuring that adequate retention and lifecycle of backups has been configured | Dashboarding of backup jobs |

<!-- Table footnotes -->

[AWS Cost Optimisation]: https://aws.amazon.com/about-aws/whats-new/2024/10/aws-compute-optimizer-new-amazon-ec2-instance-types
[Practice Cloud Financial Management]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/practice-cloud-financial-management.html
[COST01-BP01 Establish ownership of cost optimization]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_function.html
[COST01-BP02 Establish a partnership between finance and technology]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_partnership.html
[COST01-BP03 Establish cloud budgets and forecasts]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_budget_forecast.html
[COST01-BP04 Implement cost awareness in your organizational processes]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_cost_awareness.html
[COST01-BP05 Report and notify on cost optimization]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_usage_report.html
[COST01-BP06 Monitor cost proactively]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_proactive_process.html
[COST01-BP07 Keep up-to-date with new service releases]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_scheduled.html
[COST01-BP08 Create a cost-aware culture]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_culture.html
[COST01-BP09 Quantify business value from cost optimization]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_cloud_financial_management_quantify_value.html
[Expenditure and usage awareness]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/expenditure-and-usage-awareness.html
[COST02-BP01 Develop policies based on your organization requirements]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_policies.html
[COST02-BP02 Implement goals and targets]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_goal_target.html
[COST02-BP03 Implement an account structure]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_account_structure.html
[COST02-BP04 Implement groups and roles]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_groups_roles.html
[COST02-BP05 Implement cost controls]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_controls.html
[COST02-BP06 Track project lifecycle]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_govern_usage_track_lifecycle.html
[Monitor cost and usage]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/monitor-cost-and-usage.html
[COST03-BP01 Configure detailed information sources]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_detailed_source.html
[COST03-BP02 Add organization information to cost and usage]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_org_information.html
[COST03-BP03 Identify cost attribution categories]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_define_attribution.html
[COST03-BP04 Establish organization metrics]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_define_kpi.html
[COST03-BP05 Configure billing and cost management tools]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_config_tools.html
[COST03-BP06 Allocate costs based on workload metrics]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_monitor_usage_allocate_outcome.html
[Decommission resources]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/decommission-resources.html
[COST04-BP01 Track resources over their lifetime]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_track.html
[COST04-BP02 Implement a decommissioning process]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_implement_process.html
[COST04-BP03 Decommission resources]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_decommission.html
[COST04-BP04 Decommission resources automatically]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_decomm_automated.html
[COST04-BP05 Enforce data retention policies]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_decomissioning_resources_data_retention.html
[Cost effective resources]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost-effective-resources.html
[COST05-BP01 Identify organization requirements for cost]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_requirements.html
[COST05-BP02 Analyze all components of the workload]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_analyze_all.html
[COST05-BP03 Perform a thorough analysis of each component]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_thorough_analysis.html
[COST05-BP04 Select software with cost-effective licensing]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_licensing.html
[COST05-BP05 Select components of this workload to optimize cost in line with organization priorities]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_select_for_cost.html
[COST05-BP06 Perform cost analysis for different usage over time]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_select_service_analyze_over_time.html
[Select the correct resource type, size, and number]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/select-the-correct-resource-type-size-and-number.html
[COST06-BP01 Perform cost modeling]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_type_size_number_resources_cost_modeling.html
[COST06-BP02 Select resource type, size, and number based on data]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_type_size_number_resources_data.html
[COST06-BP03 Select resource type, size, and number automatically based on metrics]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_type_size_number_resources_metrics.html
[COST06-BP04 Consider using shared resources]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_type_size_number_resources_shared.html
[Select the best pricing model]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/select-the-best-pricing-model.html
[COST07-BP01 Perform pricing model analysis]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_analysis.html
[COST07-BP02 Choose Regions based on cost]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_region_cost.html
[COST07-BP03 Select third-party agreements with cost-efficient terms]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_third_party.html
[COST07-BP04 Implement pricing models for all components of this workload]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_implement_models.html
[COST07-BP05 Perform pricing model analysis at the management account level]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_pricing_model_master_analysis.html
[Plan for data transfer]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/plan-for-data-transfer.html
[COST08-BP01 Perform data transfer modeling]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_data_transfer_modeling.html
[COST08-BP02 Select components to optimize data transfer cost]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_data_transfer_optimized_components.html
[COST08-BP03 Implement services to reduce data transfer costs]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_data_transfer_implement_services.html
[Manage demand and supply resources]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/manage-demand-and-supply-resources.html
[COST09-BP01 Perform an analysis on the workload demand]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_manage_demand_resources_cost_analysis.html
[COST09-BP02 Implement a buffer or throttle to manage demand]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_manage_demand_resources_buffer_throttle.html
[COST09-BP03 Supply resources dynamically]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_manage_demand_resources_dynamic.html
[Optimize over time]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/optimize-over-time.html
[COST10-BP01 Develop a workload review process]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_evaluate_new_services_review_process.html
[COST10-BP02 Review and analyze this workload regularly]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_evaluate_new_services_review_workload.html
[COST11-BP01 Perform automation for operations]: https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/cost_evaluate_cost_effort_automations_operations.html

<!-- AWS Resources -->

[Cloud Intelligence Dashboards]: https://wellarchitectedlabs.com/cloud-intelligence-dashboards/
[AWS IAM Identity Center]: https://aws.amazon.com/iam/identity-center/
[AWS Cost Anomaly Detection]: https://aws.amazon.com/aws-cost-management/aws-cost-anomaly-detection/
[AWS Config]: https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html
[AWS Instance Scheduler]: https://aws.amazon.com/solutions/implementations/instance-scheduler-on-aws/
[AWS Auto Scaling]: https://aws.amazon.com/autoscaling/
