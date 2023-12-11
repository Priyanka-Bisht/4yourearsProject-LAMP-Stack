##################### instance template ########################
data "google_compute_image" "custom_image" {
  name    = var.custom_image_name  # Replace with the name of your image
  #family  = "pipelineimage"  # If your image has no family, set this to null
  project = var.project_id
}

# Create a custom instance template
resource "google_compute_instance_template" "my_instance_template" {
  name        = var.instance_template_name
  description = var.instance_template_description

  # Specify the custom image
  disk {
    source_image = data.google_compute_image.custom_image.self_link
  }

  network_interface {
    network = var.network_name
    subnetwork = var.subnetwork_name
  }
  
  # metadata_startup_script = <<-EOF
  #   #! /bin/bash
  #   apt update
  #   cd /home/ansible
  #   npm start src --port 3000
  # EOF

  # Other instance configuration options as needed
  machine_type = var.machine_type

}

############### Auto-scaler for instance_group_manager ########################

resource "google_compute_autoscaler" "instance_group" {
  name   = var.autoscaler_name
  zone   = var.zone
  target = google_compute_instance_group_manager.my_instance_group.id

  autoscaling_policy {
    max_replicas    = var.autoscaler_max_replicas
    min_replicas    = var.autoscaler_min_replicas
    cooldown_period = var.autoscaler_cooldown_period

    cpu_utilization {
      target = var.cpu_utilization_target
    }
  }
}

############# Create an instance group manager from the instance template ################################

resource "google_compute_instance_group_manager" "my_instance_group" {
  name        = var.instance_group_name
  description = var.instance_group_description
  zone        = var.zone # Change to your desired zone

  base_instance_name = var.instance_group_base_name
  target_size       = var.instance_group_target_size # Set the desired target size
  named_port {
    name = "http"
    port = 80 # Update this to match the port your application is listening on
  }

  version {
    instance_template = google_compute_instance_template.my_instance_template.id

  }

}

######################################Firewall######################################

# resource "google_compute_firewall" "http_firewall" {
#   name    = "allow-http"
#   network = var.network_name

#   allow {
#     protocol = "tcp"
#     ports    = ["8080"]  # Change this if your application uses a different port
#   }

#   source_ranges = ["0.0.0.0/0"]  # Allowing traffic from any source (update as needed)
# }

# resource "google_compute_firewall" "lb_health_check_firewall" {
#   name    = "allow-health-check"
#   network = var.network_name

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "443"]  # Adjust based on your load balancer health check configuration
#   }

#   source_ranges = ["0.0.0.0/0"]  # Allowing traffic from any source (update as needed)
# }