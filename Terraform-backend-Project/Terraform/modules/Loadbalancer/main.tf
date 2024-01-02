########################## Network Load Balancer ################################

# Create a health check for the backend service
resource "google_compute_health_check" "lb_health_check" {
  provider = google-beta
  project = var.project_id
  name               = var.lb_name
  check_interval_sec = var.check_interval_sec
  timeout_sec        = var.timeout_sec
  tcp_health_check {
    port = 80
  }
}

data "google_compute_instance_group_manager" "my_instance_group" {
  name = var.instance_group_name
  project = var.project_id
  zone = var.zone

}

# Create a backend service with an existing instance group
resource "google_compute_backend_service" "lb_backend_service" {
  provider = google-beta
  project = var.project_id
  name                   = var.backend_service_name
  protocol               = var.protocol
  timeout_sec            = var.timeout_sec
  port_name              = var.port_name

  load_balancing_scheme   = "EXTERNAL"
  health_checks = [google_compute_health_check.lb_health_check.self_link]
  backend {
    #group = data.google_compute_instance_group_manager.my_instance_group.id
    group = data.google_compute_instance_group_manager.my_instance_group.instance_group
    balancing_mode  = "UTILIZATION"
    max_utilization = 1.0
    capacity_scaler = 1.0
  }

  
}


resource "google_compute_target_tcp_proxy" "default" {
  provider        = google-beta
  project = var.project_id
  name            = "test-proxy-health-check"
  backend_service = google_compute_backend_service.lb_backend_service.id
}

resource "google_compute_global_address" "global-address" {
   project = var.project_id
   name       = var.google_compute_global_address_name
   ip_version = "IPV4"
 }

resource "google_compute_global_forwarding_rule" "forwarding-rule" {
  provider              = google-beta
  project = var.project_id
  name                  = var.google_compute_global_forwarding_rule_name
  ip_protocol           = var.ip_protocol
  load_balancing_scheme = var.load_balancing_scheme
  port_range            = var.port_range
  target                = google_compute_target_tcp_proxy.default.id
  ip_address            = google_compute_global_address.global-address.id
}



