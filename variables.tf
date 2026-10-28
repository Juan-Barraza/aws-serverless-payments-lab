variable "region" {
  description = "AWS region where everything is deployed"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name; used as the prefix for all resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be one of: dev, test, prod."
  }
}

variable "tags" {
  description = "Additional tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "hash_key" {
  description = "Hash (partition) key of the DynamoDB orders table"
  type        = string
}

variable "log_retention_days" {
  description = "CloudWatch log retention in days; kept low to control costs"
  type        = number
  default     = 7
}

variable "api_throttle_rate" {
  description = "Steady-state request rate limit (requests per second) for the API"
  type        = number
  default     = 5
}

variable "api_throttle_burst" {
  description = "Maximum burst of requests allowed by the API"
  type        = number
  default     = 10
}

variable "paypal_ssm_prefix" {
  description = "Prefix of the manually created SSM parameters (client_id, client_secret, webhook_id)"
  type        = string
  default     = "/orders/paypal"
}

variable "paypal_base_url" {
  description = "PayPal API base URL (sandbox or live)"
  type        = string
  default     = "https://api-m.sandbox.paypal.com"
}