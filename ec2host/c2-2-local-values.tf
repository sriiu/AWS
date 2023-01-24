locals {
  owner = var.business_divsion
  environment = var.environment
  name = "${var.business_divsion}-${var.environment}"
  common_tags = {
    owners = local.owner
    environment = local.environment
    application = "Jenkins"
  }
}