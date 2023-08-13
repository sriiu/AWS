locals {
  cluster_name = "eksdemo"
  owner        = var.business_divsion
  environment  = var.environment
  name         = "${var.business_divsion}-${var.environment}"
  common_tags = {
    owners      = local.owner
    environment = local.environment
    application = "Jenkins"
  }
  eks_cluster_name = "${local.name}-${var.cluster_name}"
}

/*resource "random_string" "random" {
  length           = 4
  special          = true
  override_special = "/@£$"
}
*/