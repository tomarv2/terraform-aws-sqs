output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue."
  value       = aws_sqs_queue.queue[0].id
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue."
  value       = aws_sqs_queue.queue[0].arn
}

output "sqs_queue_tags" {
  description = "A map of tags assigned to the resource."
  value       = aws_sqs_queue.queue[0].tags
}

output "dead_letter_queue_id" {
  description = "The URL for the created dead letter Amazon SQS queue."
  value       = var.dead_letter_queue ? aws_sqs_queue.dead_letter_queue[0].id : null
}

output "dead_letter_queue_arn" {
  description = "The ARN of the dead letter SQS queue."
  value       = var.dead_letter_queue ? aws_sqs_queue.dead_letter_queue[0].arn : null
}
