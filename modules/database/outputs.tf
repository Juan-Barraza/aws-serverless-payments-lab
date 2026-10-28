output "table_name" {
  value = aws_dynamodb_table.dynamo_table.name
}

output "table_arn" {
  value = aws_dynamodb_table.dynamo_table.arn
}

output "hash_key" {
  description = "Hash key of the table, reused by the ASL and the Lambdas"
  value       = var.hash_key
}