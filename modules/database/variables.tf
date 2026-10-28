variable "table_name" {
  description = "Name table in DynamoDB"
  type        = string
}

variable "hash_key" {
  description = "Hash key for the DynamoDB table"
  type        = string
}