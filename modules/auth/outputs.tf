output "user_pool_id" {
  description = "ID of the Cognito user pool"
  value       = aws_cognito_user_pool.cognito_user_pool.id
}

output "user_pool_arn" {
  description = "ARN of the Cognito user pool"
  value       = aws_cognito_user_pool.cognito_user_pool.arn
}

output "client_id" {
  description = "ID of the app client; used as the audience of the JWT authorizer"
  value       = aws_cognito_user_pool_client.client.id
}

output "issuer" {
  description = "Token issuer URL; used by the JWT authorizer to validate tokens"
  value       = "https://${aws_cognito_user_pool.cognito_user_pool.endpoint}"
}