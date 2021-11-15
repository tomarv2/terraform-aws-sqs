output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue."
  value       = module.sqs.sqs_queue_id
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue."
  value       = module.sqs.sqs_queue_arn
}

output "dead_letter_queue_id" {
  description = "The URL for the created dead letter Amazon SQS queue."
  value       = module.sqs.dead_letter_queue_id
}

output "dead_letter_queue_arn" {
  description = "The ARN of the dead letter SQS queue."
  value       = module.sqs.dead_letter_queue_arn
}
