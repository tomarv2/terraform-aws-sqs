locals {
  sqs_queue_name         = var.sqs_queue_name != null ? var.sqs_queue_name : "${var.teamid}-${var.prjid}"
  dead_letter_queue_name = "${local.sqs_queue_name}-dead"
  redrive_policy = var.dead_letter_queue ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letter_queue[0].arn
    maxReceiveCount     = var.dead_letter_max_receive_count
  }) : null
}

resource "aws_sqs_queue" "queue" {
  count = var.deploy_sqs ? 1 : 0

  name                              = local.sqs_queue_name
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  delay_seconds                     = var.delay_seconds
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  redrive_policy                    = local.redrive_policy
  kms_master_key_id                 = var.encrypted_sqs != false ? "alias/${var.kms_master_key_alias}" : null
  kms_data_key_reuse_period_seconds = var.encrypted_sqs != false ? var.kms_data_key_reuse_period_seconds : null
  policy                            = var.policy
  tags                              = var.extra_tags != null ? merge(var.extra_tags, local.shared_tags) : merge(local.shared_tags)
}

resource "aws_sqs_queue" "dead_letter_queue" {
  count = var.dead_letter_queue ? 1 : 0

  name                              = local.dead_letter_queue_name
  message_retention_seconds         = 1209600
  max_message_size                  = var.max_message_size
  kms_master_key_id                 = var.encrypted_sqs != false ? "alias/${var.kms_master_key_alias}" : null
  kms_data_key_reuse_period_seconds = var.encrypted_sqs != false ? var.kms_data_key_reuse_period_seconds : null

  tags = var.extra_tags != null ? merge(var.extra_tags, local.shared_tags) : merge(local.shared_tags)
}
