locals {
  prefix = "${var.project}-${var.environment}"
}


module "database" {
  source     = "./modules/database"
  table_name = "${local.prefix}-orders"
  hash_key   = var.hash_key
}

module "auth" {
  source                    = "./modules/auth"
  name                      = local.prefix
  enable_user_password_auth = var.environment != "prod" # only enable for non-prod environments
}