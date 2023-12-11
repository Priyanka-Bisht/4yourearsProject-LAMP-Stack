/******************************************
	VPC configuration
 *****************************************/
resource "google_compute_network" "network" {
  name                                      = var.network_name
  auto_create_subnetworks                   = var.auto_create_subnetworks
  routing_mode                              = var.routing_mode
  project                                   = var.project_id
  description                               = var.description
  delete_default_routes_on_create           = var.delete_default_internet_gateway_routes
  mtu                                       = var.mtu
  enable_ula_internal_ipv6                  = var.enable_ipv6_ula
  internal_ipv6_range                       = var.internal_ipv6_range
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order
}

/******************************************
	       Subnet configuration
 *****************************************/

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnetwork_name
  ip_cidr_range = var.subnetwork_ip_cidr_range
  region        = var.subnetwork_region
  network       = google_compute_network.network.name
  secondary_ip_range {
    range_name    = var.subnetwork_range_name
    ip_cidr_range = var.secondary_ip_cidr_range
  }
}



/*****************************************
                  Router
***********************************************/
resource "google_compute_router" "router" {
  name    = "my-router"
  network = google_compute_network.network.name
}

resource "google_compute_router_nat" "cloud_nat" {
  name               = "cloud-nat"
  router             = google_compute_router.router.name
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}