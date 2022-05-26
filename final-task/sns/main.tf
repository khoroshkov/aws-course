resource "aws_sns_topic" "final_task_sns_topic" {
  name = var.sns_topic_name
}

resource "aws_sqs_queue" "final_task_sqs_queue" {
  name = var.sqs_name
}
output "sns_topic_arn" {
  description = "Amazon Resource Name (ARN) of AWS SNS"
  value = aws_sns_topic.final_task_sns_topic.arn
}

output "sqs_queue_url" {
  description = "Queue URL of AWS SQS"
  value = aws_sqs_queue.final_task_sqs_queue.id
}