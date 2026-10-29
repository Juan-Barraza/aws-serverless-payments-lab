variable "name" {
  description = "Name prefix for the user pool and app client"
  type        = string
}

variable "enable_user_password_auth" {
  description = "Enables the USER_PASSWORD_AUTH flow for CLI/Postman testing; keep disabled in production"
  type        = bool
  default     = false
}

variable "access_token_validity_minutes" {
  description = "Validity of the access and ID tokens, in minutes"
  type        = number
  default     = 60
}

variable "refresh_token_validity_days" {
  description = "Validity of the refresh token, in days"
  type        = number
  default     = 7
}