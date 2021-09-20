resource "aws_sqs_queue" "main" {
    name                        = format("%s%s", var.name, var.fifo ? ".fifo" : "")

    max_message_size            = var.max_message_size
    visibility_timeout_seconds  = var.visibility_timeout 
    message_retention_seconds   = var.expiration_time_seconds
    receive_wait_time_seconds   = var.receive_wait_time_seconds

    delay_seconds               = var.delay

    kms_master_key_id                   = var.kms_key != "" ? var.kms_key : aws_kms_key.main[0].arn
    kms_data_key_reuse_period_seconds   = var.kms_cache_time

    fifo_queue                  = var.fifo
    content_based_deduplication = var.fifo
    deduplication_scope         = var.fifo ? var.fifo_deduplication_scope : null
    fifo_throughput_limit       = var.fifo ? var.fifo_throughput_limit : null

    redrive_policy  = jsonencode({
        deadLetterTargetArn = aws_sqs_queue.dlq.arn
        maxReceiveCount     = var.max_retry
    })

    tags                        = var.tags    
}

resource "aws_sqs_queue" "dlq" {
    name                        = format("%s-dlq%s", var.name, var.fifo ? ".fifo" : "")

    max_message_size            = var.max_message_size
    visibility_timeout_seconds  = var.visibility_timeout_dlq
    message_retention_seconds   = var.expiration_time_seconds_dlq
    receive_wait_time_seconds   = var.receive_wait_time_seconds_dlq

    delay_seconds               = var.delay_dlq

    kms_master_key_id                   = var.kms_key != "" ? var.kms_key : aws_kms_key.main[0].arn
    kms_data_key_reuse_period_seconds   = var.kms_cache_time

    fifo_queue                  = var.fifo
    content_based_deduplication = var.fifo
    deduplication_scope         = var.fifo ? var.fifo_deduplication_scope : null
    fifo_throughput_limit       = var.fifo ? var.fifo_throughput_limit : null

    tags                        = var.tags
}