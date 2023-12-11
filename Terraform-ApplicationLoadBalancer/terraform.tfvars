# VPC
project_id                                = "arcane-premise-405104"
network_name                              = "terranetwork"
routing_mode                              = "GLOBAL"
description                               = "NETWORK"
auto_create_subnetworks                   = false
delete_default_internet_gateway_routes    = false
mtu                                       = 0
enable_ipv6_ula                           = false
internal_ipv6_range                       = null
network_firewall_policy_enforcement_order = null

# Subnetwork
subnetwork_name          = "mysubnetwork"
subnetwork_ip_cidr_range = "10.0.0.0/16"
secondary_ip_cidr_range  = "10.2.0.0/16"
subnetwork_region        = "us-central1"
subnetwork_range_name    = "subnetworkrange"

# Firewall
firewall_name = "myfirewall"

# IAM
account_id = "appengine-service-account"

# Provider
region = "us-central1"
zone   = "us-central1-c"

# Compute
custom_image_name             = "packer-1701853288"
instance_template_name        = "template"
instance_template_description = "templatedescription"
machine_type                  = "n1-standard-1"
autoscaler_name               = "autoscaler"
autoscaler_max_replicas       = 5
autoscaler_min_replicas       = 2
autoscaler_cooldown_period    = 60
cpu_utilization_target        = 0.7
instance_group_name           = "instancegroupname"
instance_group_description    = "groupdescription"
instance_group_base_name      = "groupbasename"
instance_group_target_size    = 1
instance_group_zone           = "us-central1-c"

# Load Balancer
lb_name                                    = "frontend-lb"
check_interval_sec                         = 5
timeout_sec                                = 5
backend_service_name                       = "frontend-bs"
protocol                                   = "HTTP"
port_name                                  = "http"
enable_cdn                                 = false
google_compute_global_address_name         = "computeglobal"
google_compute_url_map_name                = "frontend-urlmap"
google_compute_target_http_proxy_name      = "httpproxy"
google_compute_global_forwarding_rule_name = "forwardingrule"
ip_protocol                                = "TCP"
load_balancing_scheme                      = "EXTERNAL"
port_range                                 = "80-80"
lb_ip_name                                 = "frontend-ip"

# AppEngine
project_name       = "app-engine"
location_id        = "us-central1"
service            = "default"
location           = "us-central1"
force_destroy      = true
byte_length        = 8
deployment_version = 2
