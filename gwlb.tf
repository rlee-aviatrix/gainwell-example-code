module "gwlb-transit" {
  source                       = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version                      = "2.1.6"
  cloud                        = "AWS"
  region                       = "us-west-2"
  cidr                         = "10.0.0.0/16"
  account                      = var.account
  enable_transit_firenet       = true
  enable_gateway_load_balancer = true
}

module "gwlb-firenet" {
  source         = "terraform-aviatrix-modules/mc-firenet/aviatrix"
  version        = "1.1.2"
  firewall_image = "Palo Alto Networks VM-Series Next-Generation Firewall (BYOL)"
  transit_module = module.gwlb-transit
}