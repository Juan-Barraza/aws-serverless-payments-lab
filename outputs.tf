output "table_name" {
  description = "Name of the DynamoDB orders table"
  value       = module.database.table_name
}
