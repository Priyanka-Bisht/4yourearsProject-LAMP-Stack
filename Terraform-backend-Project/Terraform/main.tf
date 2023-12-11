module "VPC" {
  source                                    = "./modules/VPC"
  network_name                              = var.network_name
  auto_create_subnetworks                   = var.auto_create_subnetworks
  routing_mode                              = var.routing_mode
  project_id                                = var.project_id
  description                               = var.description
  delete_default_internet_gateway_routes    = var.delete_default_internet_gateway_routes
  mtu                                       = var.mtu
  enable_ipv6_ula                           = var.enable_ipv6_ula
  internal_ipv6_range                       = var.internal_ipv6_range
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order

  subnetwork_name          = var.subnetwork_name
  subnetwork_ip_cidr_range = var.subnetwork_ip_cidr_range
  secondary_ip_cidr_range  = var.secondary_ip_cidr_range
  subnetwork_region        = var.subnetwork_region
  subnetwork_range_name    = var.subnetwork_range_name

  # firewall_name = var.firewall_name
}

module "Firewall" {
  source = "./modules/Firewall"
  firewall_name = var.firewall_name
  network_name = var.network_name
  depends_on = [module.VPC]
  
}
module "IAM" {
  source     = "./modules/IAM"
  account_id = var.account_id
  project_id = var.project_id
  depends_on = [module.Compute]

}

module "Compute" {
  source                        = "./modules/Compute"
  project_id                    = var.project_id
  custom_image_name             = var.custom_image_name
  instance_template_name        = var.instance_template_name
  instance_template_description = var.instance_template_description
  network_name                  = var.network_name
  subnetwork_name               = var.subnetwork_name
  autoscaler_name               = var.autoscaler_name
  zone                          = var.zone
  autoscaler_max_replicas       = var.autoscaler_max_replicas
  autoscaler_min_replicas       = var.autoscaler_min_replicas
  autoscaler_cooldown_period    = var.autoscaler_cooldown_period
  cpu_utilization_target        = var.cpu_utilization_target
  instance_group_name           = var.instance_group_name
  instance_group_description    = var.instance_group_description
  instance_group_base_name      = var.instance_group_base_name
  instance_group_target_size    = var.instance_group_target_size
  instance_group_zone           = var.instance_group_zone
  machine_type                  = var.machine_type
  depends_on                    = [module.VPC]
}

module "Loadbalancer" {
  source                                     = "./modules/Loadbalancer"
  lb_name                                    = var.lb_name
  check_interval_sec                         = var.check_interval_sec
  timeout_sec                                = var.timeout_sec
  backend_service_name                       = var.backend_service_name
  protocol                                   = var.protocol
  port_name                                  = var.port_name
  google_compute_global_address_name         = var.google_compute_global_address_name
  region                                     = var.region
  google_compute_global_forwarding_rule_name = var.google_compute_global_forwarding_rule_name
  ip_protocol                                = var.ip_protocol
  load_balancing_scheme                      = var.load_balancing_scheme
  port_range                                 = var.port_range
  instance_group_name                        = var.instance_group_name
  depends_on                                 = [module.Compute]
  project_id                                 = var.project_id
  zone                                       = var.zone
  # enable_cdn                                 = var.enable_cdn
  # google_compute_url_map_name                = var.google_compute_url_map_name
  # google_compute_target_http_proxy_name      = var.google_compute_target_http_proxy_name
  # lb_ip_name                                 = var.lb_ip_name


}

module "AppEngine" {
  source             = "./modules/AppEngine"
  project_id         = var.project_id
  location_id        = var.location_id
  service            = var.service
  location           = var.location
  force_destroy      = var.force_destroy
  byte_length        = var.byte_length
  depends_on         = [module.IAM]
  deployment_version = var.deployment_version

}