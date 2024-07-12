locals {
  well_architected_framework_rel09_common_tags = merge(local.well_architected_framework_operational_excellence_common_tags, {
    question_id = "data-backup"
  })
}

benchmark "well_architected_framework_rel09" {
  title       = "REL9 How do you back up data?"
  description = "Back up data, applications, and configuration to meet your requirements for recovery time objectives (RTO) and recovery point objectives (RPO)."

  children = [
    benchmark.well_architected_framework_rel09_bp01,
    benchmark.well_architected_framework_rel09_bp02,
    benchmark.well_architected_framework_rel09_bp03,
    benchmark.well_architected_framework_rel09_bp04
  ]

  tags = local.well_architected_framework_rel09_common_tags
}

benchmark "well_architected_framework_rel09_bp01" {
  title       = "REL09-BP01 Identify and back up all data that needs to be backed up, or reproduce the data from sources"
  description = "Identify and back up all data that needs to be backed up, or ensure you can reproduce the data from sources to meet your recovery objectives."

  children = [
    control.csv_well_architected_framework_rel09_bp01
  ]

  tags = merge(local.well_architected_framework_rel09_common_tags, {
    choice_id = "identify_backup_data",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel09_bp02" {
  title       = "REL09-BP02 Secure and encrypt backups"
  description = "Secure and encrypt backups to protect the data from unauthorized access and ensure its integrity during storage and transit."

  children = [
    control.csv_well_architected_framework_rel09_bp02
  ]

  tags = merge(local.well_architected_framework_rel09_common_tags, {
    choice_id = "secure_encrypt_backups",
    risk      = "High"
  })
}

benchmark "well_architected_framework_rel09_bp03" {
  title       = "REL09-BP03 Perform data backup automatically"
  description = "Perform data backup automatically to ensure that backups are consistently created and up to date."

  children = [
    control.csv_well_architected_framework_rel09_bp03
  ]

  tags = merge(local.well_architected_framework_rel09_common_tags, {
    choice_id = "automate_backups",
    risk      = "Medium"
  })
}

benchmark "well_architected_framework_rel09_bp04" {
  title       = "REL09-BP04 Perform periodic recovery of the data to verify backup integrity and processes"
  description = "Perform periodic recovery of the data to verify the integrity of your backups and the effectiveness of your backup processes."

  children = [
    control.csv_well_architected_framework_rel09_bp04
  ]

  tags = merge(local.well_architected_framework_rel09_common_tags, {
    choice_id = "verify_backup_integrity",
    risk      = "Medium"
  })
}

# Controls
control "csv_well_architected_framework_rel09_bp01" {
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
      pillar = 'reliability' AND best_practise = 'REL09-BP01'
    EOT
}

control "csv_well_architected_framework_rel09_bp02" {
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
      pillar = 'reliability' AND best_practise = 'REL09-BP02'
    EOT
}

control "csv_well_architected_framework_rel09_bp03" {
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
      pillar = 'reliability' AND best_practise = 'REL09-BP03'
    EOT
}

control "csv_well_architected_framework_rel09_bp04" {
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
      pillar = 'reliability' AND best_practise = 'REL09-BP04'
    EOT
}

#benchmark "well_architected_framework_rel09_bp02" {
#    aws_compliance.control.backup_recovery_point_encryption_enabled,
#    aws_compliance.control.dynamodb_table_encryption_enabled,
#    aws_compliance.control.ec2_ebs_default_encryption_enabled,
#    aws_compliance.control.ebs_volume_encryption_at_rest_enabled,
#    aws_compliance.control.rds_db_instance_encryption_at_rest_enabled,
#    aws_compliance.control.rds_db_snapshot_encrypted_at_rest,
#    aws_compliance.control.s3_bucket_default_encryption_enabled

#benchmark "well_architected_framework_rel09_bp03" {
#
#    aws_compliance.control.backup_recovery_point_manual_deletion_disabled,
#    aws_compliance.control.backup_recovery_point_min_retention_35_days,
##    aws_compliance.control.dynamodb_table_in_backup_plan,
##    aws_compliance.control.dynamodb_table_point_in_time_recovery_enabled,
#    aws_compliance.control.dynamodb_table_protected_by_backup_plan,
 #   aws_compliance.control.ec2_instance_protected_by_backup_plan,
#    aws_compliance.control.elasticache_redis_cluster_automatic_backup_retention_15_days,
 #   aws_compliance.control.fsx_file_system_protected_by_backup_plan,
#    aws_compliance.control.rds_db_cluster_aurora_backtracking_enabled,
 #   aws_compliance.control.rds_db_cluster_aurora_protected_by_backup_plan,
#    aws_compliance.control.rds_db_instance_backup_enabled
