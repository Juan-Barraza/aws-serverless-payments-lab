resource "aws_cognito_user_pool" "cognito_user_pool" {
  name = "${var.name}-users"

  username_attributes      = ["email"]
  auto_verified_attributes = ["email"]
  deletion_protection      = "INACTIVE" # lab: lets terraform destroy remove the pool

  admin_create_user_config {
    allow_admin_create_user_only = true # no self-registration
  }

  password_policy {
    minimum_length    = 12
    require_lowercase = true
    require_uppercase = true
    require_numbers   = true
    require_symbols   = true
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name         = "${var.name}-client"
  user_pool_id = aws_cognito_user_pool.cognito_user_pool.id

  generate_secret = false # public client (SPA/mobile): a secret could not be kept safe there

  explicit_auth_flows = compact([
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
    var.enable_user_password_auth ? "ALLOW_USER_PASSWORD_AUTH" : "",
  ])

  access_token_validity  = var.access_token_validity_minutes
  id_token_validity      = var.access_token_validity_minutes
  refresh_token_validity = var.refresh_token_validity_days

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }

  prevent_user_existence_errors = "ENABLED" # same error for unknown user and wrong password
}