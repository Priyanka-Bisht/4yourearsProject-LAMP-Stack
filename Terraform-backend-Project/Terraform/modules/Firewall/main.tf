/******************************************
	Firewall configuration
 *****************************************/
resource "google_compute_firewall" "firewall" {
  name    = var.firewall_name
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

# resource "google_compute_firewall" "http_firewall" {
#   name    = "allow-http"
#   network = var.network_name

#   allow {
#     protocol = "tcp"
#     ports    = ["8080"]  # Change this if your application uses a different port
#   }

#   source_ranges = ["0.0.0.0/0"]  # Allowing traffic from any source (update as needed)
# }

resource "google_compute_firewall" "lb_health_check_firewall" {
  name    = "allow-health-check"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["443"]  # Adjust based on your load balancer health check configuration
  }

  source_ranges = ["0.0.0.0/0"]  # Allowing traffic from any source (update as needed)
}