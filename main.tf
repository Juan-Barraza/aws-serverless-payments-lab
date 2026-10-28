locals {
  prefix = "${var.project}-${var.environment}"
}


module "database" {
  source     = "./modules/database"
  table_name = "${local.prefix}-orders"
  hash_key   = var.hash_key
}