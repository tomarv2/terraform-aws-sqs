variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "deploy_sqs" {
  description = "Feature flag, true or false"
  default     = true
  type        = bool
}

variable "custom_tags" {
  type        = any
  description = "Extra custom tags"
  default     = null
}

variable "sqs_queue_name" {
  description = "SQS name"
  type        = string
  default     = null
}

variable "dead_letter_queue" {
  type        = bool
  description = "Whether to create a matching dead letter queue"
  default     = false
}

variable "visibility_timeout_seconds" {
  type        = number
  description = "Passthrough to aws_sqs_queue module"
  default     = 30
}

variable "message_retention_seconds" {
  type        = number
  description = "Passthrough to aws_sqs_queue module"
  default     = 345600
}

variable "max_message_size" {
  type        = number
  description = "Passthrough to aws_sqs_queue module"
  default     = 262144
}

variable "delay_seconds" {
  type        = number
  description = "Passthrough to aws_sqs_queue module"
  default     = 0
}

variable "receive_wait_time_seconds" {
  type        = number
  description = "Passthrough to aws_sqs_queue module"
  default     = 0
}

variable "dead_letter_max_receive_count" {
  type        = number
  description = "Passthrough to aws_sqs_queue module  redrive_policy: maxReceiveCount"
  default     = 5
}

variable "kms_master_key_alias" {
  type        = string
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK."
  default     = "aws/sqs"
}

variable "kms_data_key_reuse_period_seconds" {
  type        = number
  description = "Passthrough to aws_sqs_queue module"
  default     = 300
}

variable "policy" {
  description = "The policy json or file"
  default     = null
  type        = string
}

variable "encrypted_sqs" {
  description = "Feature flag, true or false"
  default     = true
  type        = bool
}
