################################################################################
# s3 bucket outputs
################################################################################

output "s3_id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.that.id
}

output "s3_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.that.arn
}

################################################################################
# DynamoDB outputs
################################################################################

output "dynamodb_arn" {
  description = "The arn of the table"
  value       = aws_dynamodb_table.that.arn
}

output "dynamodb_id" {
  description = "The name of the table"
  value       = aws_dynamodb_table.that.id
}

################################################################################
# KMS outputs
################################################################################

output "kms_id" {
  description = "The id of the KMS key"
  value       = aws_kms_key.that.id
}

output "kms_alias" {
  description = "The name of the KMS key alias"
  value       = aws_kms_alias.that.name
}
