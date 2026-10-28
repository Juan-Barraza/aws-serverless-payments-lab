output "table_name" {
  value = aws_dynamodb_table.this.name
}

output "table_arn" {
  value = aws_dynamodb_table.this.arn
}

output "hash_key" {
  description = "Hash key of the table, reused by the ASL and the Lambdas"
  value       = var.hash_key
}