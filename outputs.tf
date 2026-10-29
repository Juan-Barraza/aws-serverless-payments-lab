output "table_name" {
  description = "Name of the DynamoDB orders table"
  value       = module.database.table_name
}

output "user_pool_id" {
  description = "ID of the Cognito user pool"
  value       = module.auth.user_pool_id
}

output "client_id" {
  description = "ID of the Cognito app client"
  value       = module.auth.client_id
}

output "issuer" {
  description = "Token issuer URL"
  value       = module.auth.issuer
}