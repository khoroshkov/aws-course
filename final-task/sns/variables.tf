variable "sns_topic_name" {
  description = "Final task sns topic name"
  type        = string
  default     = "edu-lohika-training-aws-sns-topic"
}

variable "sqs_name" {
  description = "Final task sqs name"
  type        = string
  default     = "edu-lohika-training-aws-sqs-queue"
}