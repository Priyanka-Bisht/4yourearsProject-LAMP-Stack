/******************************************
	Firewall configuration
 *****************************************/
resource "google_compute_firewall" "lb_health_check_firewall" {
  name    = "allow-health-check"
  network = var.network_name
  priority = 1000
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080"]  
  }

  source_ranges = ["0.0.0.0/0"]  # Allowing traffic from any source (update as needed)
}


resource "google_compute_firewall" "firewall" {
  name    = var.firewall_name
  network = var.network_name

  priority = 1001
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}



