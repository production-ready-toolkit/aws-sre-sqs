output "queue" {
  value = aws_sqs_queue.main
}

output "dlq" {
  value = aws_sqs_queue.dlq
}

output "kms" {
    value = aws_kms_key.main
}